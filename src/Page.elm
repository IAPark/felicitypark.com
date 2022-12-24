module Page exposing (main)

import Browser
import Html exposing (Html, button, div, text, input, span)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput, onClick)
import Hotkeys exposing (onEnter)
import TextImage exposing (heroImage)
import Html exposing (img)

passsword = "test"
unlockedMessaged = "unlocked"

main =
    Browser.sandbox { init = init, update = update, view = view }


type Model
    = Locked String
    | Failed String
    | Unlocked

init = Locked ""

--Process.sleep 1000
--    |> Task.perform (\_ -> msg)


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
            if value == passsword then
                Unlocked
            else
                Failed value 
        _ ->
            model

viewLocked: String -> Html Msg
viewLocked s = div [class "view-locked"] [
        input [ placeholder "Enter the code here!", value s, onInput Change, onEnter Check ] [],
        button [ onClick Check ] [ text "Check" ]
    ]

view : Model -> Html Msg
view model =
        div [class "content"] [
            --heroImage 500 True,
            (div [class "clue"] [
                text "On the bottom of your clues you will find the number to substitute for a \"a\", on your next clue you shall find \"b\", and on your last clue \"c\""
            ]),
            (div [class "math"] [
                span [] [text "Solve for x:" ],
                img [src "math_equation.jpg"] []
            ])
            ,(case model of
                Locked s
                    -> viewLocked s
                Failed s
                    -> viewLocked s
                Unlocked
                    -> div [] [text unlockedMessaged]
            )
        ]
        
        