module Main exposing (..)

import Array exposing (..)
import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Tuple exposing (..)



-- MODEL


type alias Model =
    { inputMonth : Int
    , months : Array String
    , message : String
    }


init : Model
init =
    Model 0 (Array.fromList [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]) ""



-- UPDATE


type Msg
    = UpdateMonth String
    | Convert


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateMonth inp ->
            case String.toInt inp of
                Just intVal ->
                    { model | inputMonth = intVal }

                Nothing ->
                    { model | inputMonth = 0 }

        Convert ->
            if model.inputMonth > 12 || model.inputMonth < 1 then
                { model | message = "Month number " ++ String.fromInt model.inputMonth ++ " is not a valid month." }

            else
                case Array.get (model.inputMonth - 1) model.months of
                    Just monthName ->
                        { model | message = "Month number " ++ String.fromInt model.inputMonth ++ " is " ++ monthName ++ "." }

                    Nothing ->
                        { model | message = "Error: Unable to find the month." }



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label []
            [ text "Please enter the number of month: "
            , input
                [ type_ "text"
                , onInput UpdateMonth
                , value
                    (if model.inputMonth == 0 then
                        ""

                     else
                        String.fromInt model.inputMonth
                    )
                ]
                []
            ]
        , button [ onMouseDown Convert ] [ text "Convert" ]
        , br [] []
        , text model.message
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
