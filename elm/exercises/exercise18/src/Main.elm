module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- NEEDS WORK
-- MODEL


type alias Model =
    { units : Units
    , degrees : Degrees
    }


type Degrees
    = Input Float
    | Converted Float


type Units
    = Fahrenheit
    | Celsius


init : Model
init =
    Model Fahrenheit (Input 0)



-- UPDATE


type Msg
    = UpdateUnits String
    | UpdateDegrees String
    | ConvertTemps


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateUnits units ->
            let
                newUnits =
                    case units of
                        "Fahrenheit" ->
                            Fahrenheit

                        "Celsius" ->
                            Celsius

                        _ ->
                            model.units
            in
            { model | units = newUnits }

        UpdateDegrees degrees ->
            case String.toFloat degrees of
                Just temp ->
                    { model | degrees = Input temp }

                Nothing ->
                    { model | degrees = Input 0 }

        -- let
        --     currentDegrees =
        --         case model.degrees of
        --             Input temp ->
        --                 temp
        --             Converted temp ->
        --                 temp
        -- in
        -- { model | degrees = Input (String.toFloat degrees |> Maybe.withDefault currentDegrees) }
        ConvertTemps ->
            let
                conversion =
                    case ( model.units, model.degrees ) of
                        ( Fahrenheit, Input temp ) ->
                            (temp - 32) * (5 / 9)

                        ( Celsius, Input temp ) ->
                            (temp * (9 / 5)) + 32

                        _ ->
                            0
            in
            { model | degrees = Converted conversion }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ Html.form [ onSubmit ConvertTemps ]
            [ label []
                [ text "Convert from "
                , select [ onInput UpdateUnits ]
                    [ option [ value "Fahrenheit", selected (model.units == Fahrenheit) ] [ text "Fahrenheit" ]
                    , option [ value "Celsius", selected (model.units == Celsius) ] [ text "Celsius" ]
                    , br [] []
                    ]
                ]
            , br [] []
            , label []
                [ text "Degrees: "
                , input [ type_ "number", value (degreesToString model.degrees), onInput UpdateDegrees ] []
                ]
            , button [ type_ "submit" ] [ text "Convert" ]
            ]
        , case model.degrees of
            Converted temp ->
                div [] [ text (String.fromFloat temp) ]

            Input _ ->
                text ""
        ]


degreesToString : Degrees -> String
degreesToString degrees =
    case degrees of
        Input temp ->
            String.fromFloat temp

        Converted temp ->
            String.fromFloat temp



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
