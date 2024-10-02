module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { noun : String
    , verb : String
    , adjective : String
    , adverb : String
    , showMadLib : Bool
    }


init : Model
init =
    Model "" "" "" "" False



-- UPDATE


type Msg
    = UpdateNoun String
    | UpdateVerb String
    | UpdateAdjective String
    | UpdateAdverb String


update : Msg -> Model -> Model
update msg model =
    let
        allFieldsValid =
            String.length model.noun
                > 0
                && String.length model.verb
                > 0
                && String.length model.adjective
                > 0
                && String.length model.adverb
                > 0
    in
    case msg of
        UpdateNoun n ->
            { model | noun = n, showMadLib = allFieldsValid }

        UpdateVerb v ->
            { model | verb = v, showMadLib = allFieldsValid }

        UpdateAdjective a ->
            { model | adjective = a, showMadLib = allFieldsValid }

        UpdateAdverb v ->
            { model | adverb = v, showMadLib = allFieldsValid }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ inputView "Enter a noun: " "noun" UpdateNoun
        , inputView "Enter a verb: " "verb" UpdateVerb
        , inputView "Enter an adjective: " "adjective" UpdateAdjective
        , inputView "Enter an adverb: " "adverb" UpdateAdverb
        , if model.showMadLib then
            viewMadLib model.verb model.adjective model.noun model.adverb

          else
            text ""
        ]


inputView : String -> String -> (String -> Msg) -> Html Msg
inputView label placeholderText updateMsg =
    div []
        [ text label
        , input [ type_ "text", placeholder placeholderText, onInput updateMsg ] []
        , br [] []
        ]


viewMadLib : String -> String -> String -> String -> Html Msg
viewMadLib verbText adjectiveText nounText adverbText =
    text ("Do you " ++ verbText ++ " your " ++ adjectiveText ++ " " ++ nounText ++ " " ++ adverbText ++ "? That's hilarious!")



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
