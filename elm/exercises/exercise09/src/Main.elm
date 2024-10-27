module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { width : Float
    , length : Float
    , buckets : Int
    }


init : Model
init =
    Model 0 0 0



-- UPDATE


type Msg
    = UpdateWidth String
    | UpdateLength String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateWidth newWidth ->
            let
                w =
                    abs (String.toFloat newWidth |> Maybe.withDefault model.width)

                b =
                    calculateBuckets w model.length
            in
            { model | width = w, buckets = b }

        UpdateLength newLength ->
            let
                l =
                    abs (String.toFloat newLength |> Maybe.withDefault model.length)

                b =
                    calculateBuckets model.width l
            in
            { model | length = l, buckets = b }


calculateBuckets : Float -> Float -> Int
calculateBuckets w l =
    ceiling ((w * l) / 360)



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div [] [ label [] [ text "Width: " ], input [ placeholder "Width", type_ "number", Html.Attributes.min "0", onInput UpdateWidth ] [] ]
        , div [] [ label [] [ text "Length: " ], input [ placeholder "Length", type_ "number", Html.Attributes.min "0", onInput UpdateLength ] [] ]
        , text ("Width: " ++ String.fromFloat model.width)
        , br [] []
        , text ("Length: " ++ String.fromFloat model.length)
        , br [] []
        , text ("Buckets: " ++ String.fromInt model.buckets)
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
