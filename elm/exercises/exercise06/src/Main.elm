module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes as HA exposing (..)
import Html.Events exposing (..)
import Task
import Time exposing (..)



-- MODEL


type alias Model =
    { currentAge : Int
    , retirementAge : Int
    , yearsToRetire : Int
    , retirementYear : Int
    , displayResults : Bool
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model 35 65 0 0 False, Cmd.none )



-- UPDATE


type Msg
    = UpdateCurrentAge String
    | UpdateRetirementAge String
    | CalculateRetirement
    | GotCurrentTime Time.Posix
    | Reset


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UpdateCurrentAge newAgeStr ->
            case String.toInt newAgeStr of
                Just newAge ->
                    ( { model | currentAge = newAge }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        UpdateRetirementAge newRetirementAgeStr ->
            case String.toInt newRetirementAgeStr of
                Just newRetirementAge ->
                    ( { model | retirementAge = newRetirementAge }, Cmd.none )

                _ ->
                    ( model, Cmd.none )

        CalculateRetirement ->
            if isValidInput model.currentAge && isValidInput model.retirementAge then
                ( model, Time.now |> Task.perform GotCurrentTime )

            else
                ( model, Cmd.none )

        GotCurrentTime posixTime ->
            let
                currentYear =
                    toYear utc posixTime

                yearsToRetire =
                    model.retirementAge - model.currentAge

                retirementYear =
                    currentYear + yearsToRetire
            in
            ( { model | yearsToRetire = yearsToRetire, retirementYear = retirementYear, displayResults = True }, Cmd.none )

        Reset ->
            let
                ( newModel, _ ) =
                    init ()
            in
            ( newModel, Cmd.none )


isValidInput : Int -> Bool
isValidInput input =
    input > 0 && input <= 120



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ if not model.displayResults then
            displayPrecalculated model

          else
            displayCalculated model
        ]


labeledInput : String -> String -> String -> (String -> Msg) -> Html Msg
labeledInput labelText val placeholderText updateCmd =
    div []
        [ text labelText
        , input
            [ type_ "number"
            , HA.min "1"
            , HA.max "120"
            , step "1"
            , style "width" "10ch"
            , style "height" "2.5ch"
            , value val
            , placeholder placeholderText
            , onInput updateCmd
            ]
            []
        ]


displayPrecalculated : Model -> Html Msg
displayPrecalculated model =
    div []
        [ labeledInput "What is your current age?" (String.fromInt model.currentAge) "Current Age" UpdateCurrentAge
        , labeledInput "At what age would you like to retire?" (String.fromInt model.retirementAge) "Retirement Age" UpdateRetirementAge
        , div []
            [ if not (isValidInput model.currentAge) || not (isValidInput model.retirementAge) then
                div []
                    [ text "Ages must be between 1 and 120."
                    , br [] []
                    ]

              else
                text ""
            ]
        , button [ onClick CalculateRetirement ] [ text "Calculate!" ]
        ]


displayCalculated : Model -> Html Msg
displayCalculated model =
    div []
        [ if model.yearsToRetire <= 0 then
            text ("You retired " ++ String.fromInt (abs model.yearsToRetire) ++ " years ago in " ++ String.fromInt model.retirementYear ++ "... Congratulations!")

          else
            div []
                [ text ("You have " ++ String.fromInt model.yearsToRetire ++ " years left until you can retire.")
                , br [] []
                , text ("It's " ++ String.fromInt (model.retirementYear - model.yearsToRetire) ++ ", so you can retire in " ++ String.fromInt model.retirementYear)
                ]
        , br [] []
        , button [ onClick Reset ] [ text "Reset" ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
