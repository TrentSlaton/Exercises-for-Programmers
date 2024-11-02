module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { password : String
    , message : String
    , validPw : String
    }


init : Model
init =
    Model "" "" "abc$123"



-- UPDATE


type Msg
    = UpdatePassword String
    | Submit


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdatePassword str ->
            { model | password = str }

        Submit ->
            if model.password == model.validPw then
                { model | password = "", message = "Welcome!" }

            else
                { model | password = "", message = "I don't know you." }



-- VIEW


view : Model -> Html Msg
view model =
    Html.form [ onSubmit (onSubmitHandler Submit) ]
        [ label []
            [ text "What is the password? "
            , input [ type_ "password", placeholder "password", onInput UpdatePassword, value model.password ] []
            ]
        , button [ type_ "submit" ] [ text "Submit" ]
        , div [] [ text model.message ]
        ]


onSubmitHandler : Msg -> Msg
onSubmitHandler msg =
    msg



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
