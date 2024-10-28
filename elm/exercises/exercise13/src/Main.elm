module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { principal : Float
    , interestRate : Float
    , compoundRate : Int
    , years : Int
    , total : Float
    }


init : Model
init =
    Model 0 0 0 0 0



-- UPDATE


type Msg
    = UpdatePrincipal String
    | UpdateInterestRate String
    | UpdateYears String
    | UpdateCompoundRate String


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

        UpdateCompoundRate str ->
            let
                c =
                    abs (String.toInt str |> Maybe.withDefault model.compoundRate)

                t =
                    calculateTotal { model | compoundRate = c }
            in
            { model | compoundRate = c, total = t }


calculateTotal : Model -> Float
calculateTotal model =
    model.principal * (1 + (model.interestRate / toFloat model.compoundRate)) ^ toFloat (model.compoundRate * model.years)



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ label [] [ text "What is the principal amount? ", input [ placeholder "principal", type_ "number", Html.Attributes.min "0", onInput UpdatePrincipal ] [] ]
        , br [] []
        , label [] [ text "What is the interest rate? ", input [ placeholder "interest rate", type_ "number", Html.Attributes.min "0", onInput UpdateInterestRate ] [] ]
        , br [] []
        , label [] [ text "What is the number of years? ", input [ placeholder "years", type_ "number", Html.Attributes.min "0", onInput UpdateYears ] [] ]
        , br [] []
        , label [] [ text "How many times does the interest compound per year? ", input [ placeholder "compound rate", type_ "number", Html.Attributes.min "0", onInput UpdateCompoundRate ] [] ]
        , br [] []
        , text ("Principal: " ++ String.fromFloat model.principal)
        , br [] []
        , text ("Interest Rate: " ++ String.fromFloat model.interestRate)
        , br [] []
        , text ("CompoundRate: " ++ String.fromInt model.compoundRate)
        , br [] []
        , text ("Years: " ++ String.fromInt model.years)
        , br [] []
        , text ("Total: " ++ String.fromFloat model.total)
        ]



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
