module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Tuple exposing (..)



-- MODEL


type alias Model =
    { item1 : ( Int, Float )
    , item2 : ( Int, Float )
    , item3 : ( Int, Float )
    , subtotal : Float
    , tax : Float
    , total : Float
    }


init : Model
init =
    Model ( 0, 0 ) ( 0, 0 ) ( 0, 0 ) 0 0 0



-- UPDATE


type Msg
    = UpdateItem Int String String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateItem item field newVal ->
            let
                updateTuple ( qty, price ) =
                    case field of
                        "qty" ->
                            ( abs (String.toInt newVal |> Maybe.withDefault qty), price )

                        "price" ->
                            ( qty, abs (String.toFloat newVal |> Maybe.withDefault price) )

                        _ ->
                            ( qty, price )

                updatedItem =
                    case item of
                        1 ->
                            updateTuple model.item1

                        2 ->
                            updateTuple model.item2

                        3 ->
                            updateTuple model.item3

                        _ ->
                            ( 0, 0 )

                updatedModel =
                    case item of
                        1 ->
                            { model | item1 = updatedItem }

                        2 ->
                            { model | item2 = updatedItem }

                        3 ->
                            { model | item3 = updatedItem }

                        _ ->
                            model

                st =
                    calculateTotal updatedModel

                tx =
                    st * 0.055

                t =
                    st + tx
            in
            { updatedModel | subtotal = st, tax = tx, total = t }


calculateTotal : Model -> Float
calculateTotal m =
    let
        item1Total =
            toFloat (first m.item1) * second m.item1

        item2Total =
            toFloat (first m.item2) * second m.item2

        item3Total =
            toFloat (first m.item3) * second m.item3
    in
    item1Total + item2Total + item3Total



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ label []
                [ text "Item 1"
                , br [] []
                , label [] [ text "Qty", input [ placeholder "Qty", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 1 "qty") ] [] ]
                , label [] [ text "Price", input [ placeholder "Price", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 1 "price") ] [] ]
                ]
            ]
        , div []
            [ label []
                [ text "Item 2"
                , br [] []
                , label [] [ text "Qty", input [ placeholder "Qty", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 2 "qty") ] [] ]
                , label [] [ text "Price", input [ placeholder "Price", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 2 "price") ] [] ]
                ]
            ]
        , div []
            [ label []
                [ text "Item 3"
                , br [] []
                , label [] [ text "Qty", input [ placeholder "Qty", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 3 "qty") ] [] ]
                , label [] [ text "Price", input [ placeholder "Price", type_ "number", Html.Attributes.min "0", onInput (UpdateItem 3 "price") ] [] ]
                ]
            ]
        , label [] [ text "Subtotal: ", text (String.fromFloat model.subtotal) ]
        , br [] []
        , label [] [ text "Tax: ", text (String.fromFloat model.tax) ]
        , br [] []
        , label [] [ text "Total: ", text (String.fromFloat model.total) ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
