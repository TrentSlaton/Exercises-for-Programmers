module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { principal : Float
    , interestRate : Float
    , years : Int
    , total : Float
    }


init : Model
init =
    Model 0 0 0 0



-- UPDATE


type Msg
    = UpdatePrincipal String
    | UpdateInterestRate String
    | UpdateYears String


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdatePrincipal str ->
            let
                p =
                    abs (String.toFloat str |> Maybe.withDefault model.principal)

                t =
                    calculateTotal { model | principal = p }
            in
            { model | principal = p, total = t }

        UpdateInterestRate str ->
            let
                i =
                    abs (String.toFloat str |> Maybe.withDefault model.interestRate) / 100

                t =
                    calculateTotal { model | interestRate = i }
            in
            { model | interestRate = i, total = t }

        UpdateYears str ->
            let
                y =
                    abs (String.toInt str |> Maybe.withDefault model.years)

                t =
                    calculateTotal { model | years = y }
            in
            { model | years = y, total = t }


calculateTotal : Model -> Float
calculateTotal model =
    model.principal * (1 + (model.interestRate * toFloat model.years))



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "Enter the principle: ", input [ placeholder "priciple", type_ "number", Html.Attributes.min "0", onInput UpdatePrincipal ] [] ]
        , br [] []
        , label [] [ text "Enter the rate of interest: ", input [ placeholder "interest rate", type_ "number", Html.Attributes.min "0", onInput UpdateInterestRate ] [] ]
        , br [] []
        , label [] [ text "Enter the number of years: ", input [ placeholder "years", type_ "number", Html.Attributes.min "0", onInput UpdateYears ] [] ]
        , br [] []
        , text ("Principle: " ++ String.fromFloat model.principal)
        , br [] []
        , text ("Interest Rate: " ++ String.fromFloat model.interestRate)
        , br [] []
        , text ("Years: " ++ String.fromInt model.years)
        , br [] []
        , text ("After " ++ String.fromInt model.years ++ " years at " ++ String.fromFloat model.interestRate ++ ", " ++ "the investment will be worth $" ++ String.fromFloat model.total ++ ".")
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
