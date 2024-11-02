module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { weight : Int
    , gender : Gender
    , drinks : Int
    , abv : Float
    , hours : Int
    , bac : Float
    , message : String
    }


type Gender
    = Male
    | Female


init : Model
init =
    Model 0 Male 0 0 0 0 ""



-- UPDATE


type Msg
    = UpdateWeight String
    | UpdateGender Gender
    | UpdateDrinks String
    | UpdateABV String
    | UpdateHours String
    | Calculate


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateWeight weight ->
            { model | weight = String.toInt weight |> Maybe.withDefault model.weight }

        UpdateGender gender ->
            { model | gender = gender }

        UpdateDrinks drinks ->
            { model | drinks = String.toInt drinks |> Maybe.withDefault model.drinks }

        UpdateABV abv ->
            { model | abv = String.toFloat abv |> Maybe.withDefault model.abv }

        UpdateHours hours ->
            { model | hours = String.toInt hours |> Maybe.withDefault model.hours }

        Calculate ->
            let
                dist =
                    if model.gender == Male then
                        0.73

                    else
                        0.66

                bac =
                    ((toFloat model.drinks * 5.14) / (toFloat model.weight * dist)) - (0.015 * toFloat model.hours)

                message =
                    if bac >= 0.08 then
                        "Your BAC is: " ++ String.fromFloat bac ++ ". It is not legal for you to drive."

                    else if bac == 0 then
                        ""

                    else
                        "Your BAC is: " ++ String.fromFloat bac ++ ". It is legal for you to drive."
            in
            { model | bac = bac, message = message }



-- VIEW


view : Model -> Html Msg
view model =
    Html.form [ onSubmit Calculate ]
        [ label []
            [ text "Weight in pounds: "
            , input
                [ type_ "number"
                , Html.Attributes.min "0"
                , step "10"
                , value (String.fromInt model.weight)
                , onInput UpdateWeight
                ]
                []
            ]
        , br [] []
        , label []
            [ text "Gender: "
            , input [ type_ "radio", name "gender", id "male", checked (model.gender == Male), onInput (always (UpdateGender Male)) ] []
            , label [ for "male" ] [ text "Male" ]
            , input [ type_ "radio", name "gender", id "female", checked (model.gender == Female), onInput (always (UpdateGender Female)) ] []
            , label [ for "female" ] [ text "Female" ]
            ]
        , br [] []
        , label []
            [ text "Ounces consumed: "
            , input
                [ type_ "number"
                , Html.Attributes.min "0"
                , value (String.fromInt model.drinks)
                , onInput UpdateDrinks
                ]
                []
            ]
        , br [] []
        , label []
            [ text "ABV of drinks: "
            , input
                [ type_ "number"

                -- , Html.Attributes.min "0"
                , value (String.fromFloat model.abv)
                , onInput UpdateABV
                ]
                []
            ]
        , br [] []
        , label []
            [ text "Hours since last drink: "
            , label []
                [ input
                    [ type_ "number"
                    , Html.Attributes.min "0"
                    , value (String.fromInt model.hours)
                    , onInput UpdateHours
                    ]
                    []
                ]
            ]
        , button [ type_ "submit" ] [ text "Calculate" ]
        , br [] []
        , text model.message
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
