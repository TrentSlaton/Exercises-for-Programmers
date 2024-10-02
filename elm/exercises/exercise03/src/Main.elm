module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { quote : String
    , author : String
    , validQuote : Bool
    , validAuthor : Bool
    }


init : Model
init =
    Model "" "" False False



-- UPDATE


type Msg
    = UpdateQuote String
    | UpdateAuthor String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateQuote q ->
            { model | quote = q, validQuote = String.length q > 0 }

        UpdateAuthor a ->
            { model | author = a, validAuthor = String.length a > 0 }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ inputView "What is the quote?" "quote" model.quote UpdateQuote
        , if model.validQuote then
            div []
                [ inputView "Who said it?" "author" model.author UpdateAuthor
                ]

          else
            text ""
        , if model.validAuthor then
            div []
                [ text (model.author ++ " says: \"" ++ model.quote ++ "\"")
                ]

          else
            text ""
        ]


inputView : String -> String -> String -> (String -> Msg) -> Html Msg
inputView labelText placeholderText valueText updateMsg =
    div []
        [ text labelText
        , input [ type_ "text", placeholder placeholderText, value valueText, onInput updateMsg ] []
        , br [] []
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
