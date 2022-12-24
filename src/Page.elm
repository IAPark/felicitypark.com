module Page exposing (main)

import Browser
import Html exposing (Html, button, div, text, input, span)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Hotkeys exposing (onEnter)
import TextImage exposing (heroImage)
import Html exposing (img)

passsword : Int
passsword = 42
main =
    Browser.sandbox { init = init, update = update, view = view }


type Model
    = Locked String Bool
    | Unlocked

init = Locked "" False

--Process.sleep 1000
--    |> Task.perform (\_ -> msg)


type Msg
    = Change String
    | Check

update : Msg -> Model -> Model
update msg model =
    case (msg, model) of
        (Change newString, Locked _ error)
            -> Locked newString error
        (Check, Locked value error) ->
            -- convert value to number and compare with the password
            if String.toInt value == (Maybe.Just passsword) then
                Unlocked
            else
                Locked "" True
        _ ->
            model

viewLocked : String -> Bool -> Html Msg
viewLocked s error = div [class "view-locked"] [
        div [class "clue"] [
                text "On the bottom of your clues you will find the number to substitute for a \"a\", on your next clue you shall find \"b\", and on your last clue \"c\""
        ],
        if error then
            div [class "math"] [
                span [] [text "Try solving for x again" ],
                img [src "math_equation.jpg"] []
            ]
        else
            div [class "math"] [
                span [] [text "Solve for x:" ],
                img [src "math_equation.jpg"] []
            ]
        ,
        input [ placeholder "Enter the value for X", value s, onInput Change, onEnter Check ] [],
        button [ onClick Check ] [ text "Check" ]
    ]


viewUnlocked = div [ class "view-unlocked"] [
        div [] [text "Trailer comes at last"],
        div [] [text "Heralding the main feature"],
        div [] [text "Returning, again and again"],
        div [] [text "A preview of what's to come"],
        div [] [text "A trailer's endless fun"]
    ]

view : Model -> Html Msg
view model =
        div [class "content"] [
            --heroImage 500 True,
            (case model of
                Locked s error
                    -> viewLocked s error
                Unlocked
                    -> viewUnlocked
            )
        ]
        
        