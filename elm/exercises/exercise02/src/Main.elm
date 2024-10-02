module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { input : String
    , length : Int
    , hidden : Bool
    }


init : Model
init =
    { input = "", length = 0, hidden = True }



-- UPDATE


type Msg
    = UpdateModel String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateModel inp ->
            { model | input = inp, length = String.length inp }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "What is the input string?"
        , input [ type_ "text", placeholder "input", onInput UpdateModel ] []
        , br [] []
        , if model.length > 0 then
            text (model.input ++ " has " ++ String.fromInt model.length ++ " characters.")

          else
            text ""
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
