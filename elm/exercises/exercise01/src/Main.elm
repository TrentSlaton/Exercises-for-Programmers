module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { name : String
    , message : String
    , hidden : Bool
    }


init : Model
init =
    { name = "", message = "", hidden = True }



-- UPDATE


type Msg
    = GetName String
    | UpdateName String
    | ToggleButton


update : Msg -> Model -> Model
update msg model =
    case msg of
        GetName name ->
            { model | message = "Hello, " ++ name ++ ", nice to meet you!", hidden = False }

        UpdateName name ->
            { model | name = name }

        ToggleButton ->
            { model | hidden = not model.hidden, name = "", message = "" }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ text "What is your name?"
        , input [ type_ "text", placeholder "Your Name", value model.name, onInput UpdateName ] []
        , button [ onClick (GetName model.name) ] [ text "Enter" ]
        , p [] [ text model.message ]
        , button [ hidden model.hidden, onClick ToggleButton ] [ text "Reset" ]
        ]


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
