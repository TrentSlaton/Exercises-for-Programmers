module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { width : Float
    , length : Float
    , areaF : Float
    , areaM : Float
    }


init : Model
init =
    Model 0 0 0 0



-- UPDATE


type Msg
    = UpdateWidth String
    | UpdateLength String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateWidth newXStr ->
            let
                newX =
                    abs (String.toFloat newXStr |> Maybe.withDefault model.width)

                newAreaF =
                    newX * model.length

                newAreaM =
                    newAreaF * 0.09290304
            in
            { model | width = newX, areaF = newAreaF, areaM = newAreaM }

        UpdateLength newYStr ->
            let
                newY =
                    abs (String.toFloat newYStr |> Maybe.withDefault model.length)

                newAreaF =
                    model.width * newY

                newAreaM =
                    newAreaF * 0.09290304
            in
            { model | length = newY, areaF = newAreaF, areaM = newAreaM }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ inputView "What is with width of the room in feet?" "Width" UpdateWidth
        , inputView "What is the length of the room in feet?" "Length" UpdateLength
        , resultsView model
        ]


inputView : String -> String -> (String -> msg) -> Html msg
inputView l p u =
    div []
        [ label []
            [ text l
            , input [ placeholder p, type_ "number", Html.Attributes.min "0", onInput u ] []
            ]
        ]


resultsView : Model -> Html msg
resultsView model =
    div []
        [ text (String.fromFloat model.width ++ " feet" ++ " * " ++ (String.fromFloat model.length ++ " feet") ++ " = " ++ String.fromFloat model.areaF ++ " ft")
        , sup [] [ text "2" ]
        , text (" = " ++ String.fromFloat model.areaM ++ " m")
        , sup [] [ text "2" ]
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
