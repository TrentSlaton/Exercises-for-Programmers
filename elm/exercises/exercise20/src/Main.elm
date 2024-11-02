module Main exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)



-- MODEL


type alias Model =
    { orderAmount : Float
    , state : State
    , county : County
    , tax : Maybe Float
    , total : Maybe Float
    }


type State
    = WI
    | IL
    | OtherState


type County
    = EauClaire
    | Dunn
    | OtherCounty


init : Model
init =
    Model 0 OtherState OtherCounty Nothing Nothing


stringToState : String -> State
stringToState str =
    case str of
        "IL" ->
            IL

        "WI" ->
            WI

        _ ->
            OtherState


stringToCounty : String -> County
stringToCounty str =
    case str of
        "EauClaire" ->
            EauClaire

        "Dunn" ->
            Dunn

        _ ->
            OtherCounty



-- UPDATE


type Msg
    = UpdateOrderAmount String
    | UpdateState State
    | UpdateCounty County
    | CalculateTotal


update : Msg -> Model -> Model
update msg model =
    case msg of
        UpdateOrderAmount orderAmount ->
            { model | orderAmount = String.toFloat orderAmount |> Maybe.withDefault model.orderAmount }

        UpdateState state ->
            let
                county =
                    if state /= WI then
                        OtherCounty

                    else
                        model.county
            in
            { model | state = state, county = county }

        UpdateCounty county ->
            { model | county = county }

        CalculateTotal ->
            let
                tax =
                    if model.state == WI then
                        if model.county == EauClaire then
                            0.005 * model.orderAmount

                        else if model.county == Dunn then
                            0.004 * model.orderAmount

                        else
                            0

                    else if model.state == IL then
                        0.08 * model.orderAmount

                    else
                        0

                total =
                    model.orderAmount + tax
            in
            { model | tax = Just tax, total = Just total }



-- VIEW


view : Model -> Html Msg
view model =
    Html.form [ onSubmit CalculateTotal ]
        [ label [] [ text "What is the order amount? ", input [ type_ "number", onInput UpdateOrderAmount, value (String.fromFloat model.orderAmount) ] [] ]
        , br [] []
        , label []
            [ text "What state do you live in? "
            , select [ onInput (UpdateState << stringToState) ]
                [ option [ value "OtherState" ] [ text "Other" ]
                , option [ value "WI" ] [ text "Wisconsin" ]
                , option [ value "IL" ] [ text "Illinois" ]
                ]
            ]
        , viewCounty model
        , viewTotal model
        , button [ type_ "submit" ] [ text "Calculate" ]
        ]


viewCounty : Model -> Html Msg
viewCounty model =
    case model.state of
        WI ->
            div []
                [ br [] []
                , label []
                    [ text "Which county in Wisconsin? "
                    , select [ onInput (UpdateCounty << stringToCounty) ]
                        [ option [ value "OtherCounty" ] [ text "Other" ]
                        , option [ value "EauClaire" ] [ text "Eau Claire" ]
                        , option [ value "Dunn" ] [ text "Dunn" ]
                        ]
                    ]
                ]

        _ ->
            text ""


viewTotal : Model -> Html msg
viewTotal model =
    case model.total of
        Just total ->
            div []
                [ label [] [ text ("Tax: " ++ String.fromFloat (Maybe.withDefault 0 model.tax)) ]
                , br [] []
                , label [] [ text ("Total: " ++ String.fromFloat total) ]
                ]

        Nothing ->
            text ""



-- MAIN


main : Program () Model Msg
main =
    Browser.sandbox { init = init, view = view, update = update }
