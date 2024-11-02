module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    Int


init : Model
init =
    0



-- UPDATE


type Msg
    = UpdateAge String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateAge str ->
            String.toInt str |> Maybe.withDefault model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "What is your age? ", input [ type_ "text", placeholder "age", onInput UpdateAge ] [] ]
        , br [] []
        , if model >= 16 then
            text "You are old enough to legally drive."

          else
            text "You are not old enough to legally drive."
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
