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
    = Hi


update : Msg -> Model -> Model
update msg model =
    case msg of
        Hi ->
            model



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text (String.fromInt model)
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
