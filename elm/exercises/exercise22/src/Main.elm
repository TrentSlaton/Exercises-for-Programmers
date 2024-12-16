module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- ChatGPT basically wrote this code... it's a bit above my head right now
-- TODO:
-- TRIM LEADING ZEROES UNLESS ZERO IS THE ONLY CHARACTER
-- ALLOW "-" TO REPLACE LEADING ZERO OR REPLACE JUST ZERO
-- MODEL


type alias Model =
    { numbers : List String
    , sum : Int
    , message : String
    }


init : Model
init =
    Model [ "0" ] 0 ""



-- UPDATE


type Msg
    = UpdateNumber Int String
    | AddNumber
    | RemoveNumber Int
    | Calculate


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateNumber index value ->
            if isValidNumber value then
                let
                    updatedNumbers =
                        List.indexedMap
                            (\i v ->
                                if i == index then
                                    value

                                else
                                    v
                            )
                            model.numbers
                in
                { model | numbers = updatedNumbers }

            else
                model

        AddNumber ->
            { model | numbers = model.numbers ++ [ "0" ] }

        RemoveNumber index ->
            let
                updatedNumbers =
                    List.indexedMap (\i v -> ( i, v )) model.numbers
                        |> List.filter (\( i, _ ) -> i /= index)
                        |> List.map Tuple.second
            in
            { model | numbers = updatedNumbers }

        Calculate ->
            let
                total =
                    model.numbers
                        |> List.map parseAsInt
                        |> List.sum

                message =
                    String.join " + " model.numbers ++ " = " ++ String.fromInt model.sum
            in
            { model | sum = total, message = message }


isValidNumber : String -> Bool
isValidNumber str =
    str == "" || str == "-" || String.toInt str /= Nothing


parseAsInt : String -> Int
parseAsInt str =
    case String.toInt str of
        Just intVal ->
            intVal

        Nothing ->
            0



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            (List.indexedMap inputField model.numbers)
        , button [ onClick AddNumber ] [ text "Add Number" ]
        , button [ onClick Calculate ] [ text "Calculate Sum" ]

        -- , div [] [ text ("Sum: " ++ String.fromInt model.sum) ]
        , div [] [ text model.message ]
        ]


inputField : Int -> String -> Html Msg
inputField index val =
    div []
        [ input
            [ value val
            , placeholder "Enter a number"
            , onInput (UpdateNumber index)
            ]
            []
        , button [ onClick (RemoveNumber index) ] [ text "X" ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
