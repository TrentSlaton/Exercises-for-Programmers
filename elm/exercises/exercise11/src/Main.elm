module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { usd : Float
    , euros : Float
    , exchangeRate : Float
    }


init : Model
init =
    Model 0 0 0



-- UPDATE


type Msg
    = UpdateEuros String
    | UpdateXRate String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateEuros newEuros ->
            let
                eu =
                    abs (String.toFloat newEuros |> Maybe.withDefault model.euros)

                usd =
                    eu * (model.exchangeRate / 100)
            in
            { model | euros = eu, usd = usd }

        UpdateXRate newXRate ->
            let
                xr =
                    abs (String.toFloat newXRate |> Maybe.withDefault model.exchangeRate)

                usd =
                    model.euros * (xr / 100)
            in
            { model | exchangeRate = xr, usd = usd }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "How many euros are you exchanging? ", input [ placeholder "euros", type_ "number", Html.Attributes.min "0", onInput UpdateEuros ] [] ]
        , br [] []
        , label [] [ text "What is the exchange rate? ", input [ placeholder "exchange rate", type_ "number", Html.Attributes.min "0", onInput UpdateXRate ] [] ]
        , br [] []
        , text (String.fromFloat model.euros ++ " euros at and exchange rate of " ++ String.fromFloat model.exchangeRate ++ " is $" ++ String.fromFloat model.usd)
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
