module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { orderAmount : Float
    , state : String
    , tax : Float
    , total : Float
    }


init : Model
init =
    Model 0 "" 0 0



-- UPDATE


type Msg
    = UpdateOrderAmount String
    | UpdateState String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateOrderAmount str ->
            let
                orderAmount =
                    String.toFloat str |> Maybe.withDefault model.orderAmount

                ( tax, total ) =
                    calculateTotals orderAmount model.state
            in
            { model | orderAmount = orderAmount, tax = tax, total = total }

        UpdateState str ->
            let
                state =
                    String.trim str |> String.toUpper

                ( tax, total ) =
                    calculateTotals model.orderAmount state
            in
            { model | tax = tax, state = state, total = total }


calculateTotals : Float -> String -> ( Float, Float )
calculateTotals orderAmount state =
    let
        tax =
            if state == "WI" then
                orderAmount * 0.055

            else
                0

        total =
            orderAmount + tax
    in
    ( tax, total )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "What is the order amount? ", input [ type_ "number", Html.Attributes.min "0", placeholder "Order Amount", onInput UpdateOrderAmount ] [] ]
        , br [] []
        , label [] [ text "What is the state? ", input [ type_ "text", placeholder "WI", onInput UpdateState, value model.state ] [] ]
        , br [] []
        , label [] [ text "The subtotal is: ", text (String.fromFloat model.orderAmount) ]
        , br [] []
        , label [] [ text "The tax is: ", text (String.fromFloat model.tax) ]
        , br [] []
        , label [] [ text "The total is: ", text (String.fromFloat model.total) ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
