module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { firstNum : Float
    , secondNum : Float
    , sum : Float
    , difference : Float
    , product : Float
    , quotient : Float
    }


init : Model
init =
    Model 0 0 0 0 0 0



-- UPDATE


type Msg
    = UpdateFirstNum String
    | UpdateSecondNum String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateFirstNum newNumStr ->
            case String.toFloat newNumStr of
                Just newNum ->
                    calculateResults { model | firstNum = newNum }

                _ ->
                    model

        UpdateSecondNum newNumStr ->
            case String.toFloat newNumStr of
                Just newNum ->
                    calculateResults { model | secondNum = newNum }

                _ ->
                    model


calculateResults : Model -> Model
calculateResults model =
    { model
        | sum = model.firstNum + model.secondNum
        , difference = model.firstNum - model.secondNum
        , product = model.firstNum * model.secondNum
        , quotient = model.firstNum / model.secondNum
    }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ inputView "First Number" UpdateFirstNum
        , inputView "Second Number" UpdateSecondNum
        , br [] []
        , resultsView model " + " model.sum
        , resultsView model " - " model.difference
        , resultsView model " * " model.product
        , resultsView model " / " model.quotient
        ]


inputView : String -> (String -> msg) -> Html msg
inputView placeholderText updateMsg =
    input [ type_ "number", placeholder placeholderText, onInput updateMsg ] []


resultsView : Model -> String -> Float -> Html Msg
resultsView model operator value =
    div []
        [ text (String.fromFloat model.firstNum ++ operator ++ String.fromFloat model.secondNum ++ " = " ++ String.fromFloat value)
        , br [] []
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
