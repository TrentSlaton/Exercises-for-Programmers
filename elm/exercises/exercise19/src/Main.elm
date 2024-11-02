module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { height : Int
    , weight : Int
    , bmi : Float
    }


init : Model
init =
    Model 0 0 0



-- UPDATE


type Msg
    = UpdateHeight String
    | UpdateWeight String
    | CalculateBMI


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateHeight h ->
            { model | height = String.toInt h |> Maybe.withDefault model.height }

        UpdateWeight w ->
            { model | weight = String.toInt w |> Maybe.withDefault model.weight }

        CalculateBMI ->
            let
                bmi =
                    (toFloat model.weight / (toFloat model.height * toFloat model.height)) * 703
            in
            { model | bmi = bmi }



-- VIEW


view : Model -> Html Msg
view model =
    Html.form [ onSubmit CalculateBMI ]
        [ label [] [ text "What is your height in inches? ", input [ type_ "number", Html.Attributes.min "0", onInput UpdateHeight, value (String.fromInt model.height) ] [] ]
        , br [] []
        , label [] [ text "What is your weight in pounds? ", input [ type_ "number", Html.Attributes.min "0", onInput UpdateWeight, value (String.fromInt model.weight) ] [] ]
        , br [] []
        , button [ type_ "submit" ] [ text "Calculate BMI" ]
        , viewBMI model
        ]


viewBMI : Model -> Html msg
viewBMI model =
    if model.bmi == 0 then
        text ""

    else if model.bmi < 18.5 then
        div []
            [ text ("Your BMI is: " ++ String.fromFloat model.bmi)
            , text " You are underweight. You should see a doctor."
            ]

    else if model.bmi > 25 then
        div []
            [ text ("Your BMI is: " ++ String.fromFloat model.bmi)
            , text " You are overweight. You should see a doctor."
            ]

    else
        div []
            [ div []
                [ text ("Your BMI is: " ++ String.fromFloat model.bmi)
                , text " You are within the ideal weight range."
                ]
            ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
