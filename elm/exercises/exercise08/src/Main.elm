module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- TODO
-- clean up and make good
-- MODEL


type alias Model =
    { people : Int
    , pizzas : Int
    , slices : Int
    , leftOvers : Int
    , each : Int
    }


init : Model
init =
    Model 0 0 0 0 0



-- UPDATE


type Msg
    = UpdatePeople String
    | UpdatePizzas String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdatePeople newPeople ->
            let
                totalPeople =
                    String.toInt newPeople |> Maybe.withDefault model.people

                ( totalSlices, slicesEach, slicesLeftOver ) =
                    calculateSlices totalPeople model.pizzas
            in
            { model | people = totalPeople, slices = totalSlices, each = slicesEach, leftOvers = slicesLeftOver }

        UpdatePizzas newPizzas ->
            let
                totalPizzas =
                    String.toInt newPizzas |> Maybe.withDefault model.pizzas

                ( totalSlices, slicesEach, slicesLeftOver ) =
                    calculateSlices model.people totalPizzas
            in
            { model | pizzas = totalPizzas, slices = totalSlices, each = slicesEach, leftOvers = slicesLeftOver }


calculateSlices : Int -> Int -> ( Int, Int, Int )
calculateSlices people pizzas =
    let
        totalSlices =
            pizzas * 8

        slicesEach =
            if people > 0 then
                totalSlices // people

            else
                0

        slicesLeftOver =
            if people > 0 then
                modBy people totalSlices

            else
                0
    in
    ( totalSlices, slicesEach, slicesLeftOver )



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "how many people? " ]
        , input [ type_ "number", Html.Attributes.min "0", onInput UpdatePeople ] []
        , br [] []
        , label [] [ text "how many pizzas? " ]
        , input [ type_ "number", Html.Attributes.min "0", onInput UpdatePizzas ] []
        , br [] []
        , text (String.fromInt model.people)
        , br [] []
        , text (String.fromInt model.pizzas)
        , br [] []
        , text ("Total Slices: " ++ String.fromInt model.slices)
        , br [] []
        , text ("Slices Each: " ++ String.fromInt model.each)
        , br [] []
        , text ("Left Overs: " ++ String.fromInt model.leftOvers)
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
