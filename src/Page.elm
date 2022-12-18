module Page exposing (main)

import Browser
import Html exposing (Html, button, div, text, input, br)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)

main =
    Browser.sandbox { init = init, update = update, view = view }


type Model
    = Locked String
    | Failed String
    | Unlocked

init = Locked ""


type Msg
    = Change String
    | Check

update : Msg -> Model -> Model
update msg model =
    case (msg, model) of
        (Change newString, Locked _)
            -> Locked newString
        (Change newString, Failed _)
            -> Locked newString
        (Check, Locked value) ->
            if value == "test" then
                Unlocked
            else
                Failed value
        _ ->
            model

viewLocked: String -> Bool -> Html Msg
viewLocked s error = div [classList [("error", error)]] [
    input [ placeholder "Enter the code here!", value s, onInput Change ] []
    , br [] []
    , button [ onClick Check ] [ text "Check" ]
    ]

view : Model -> Html Msg
view model =
    case model of
        Locked s
            -> viewLocked s False
        Failed s
            -> viewLocked s True
        Unlocked
            -> div [] [text "unlocked"]
        
        