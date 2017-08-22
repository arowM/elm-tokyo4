module Presentation.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.View as View
import Html exposing (Html, div)
import Html.Attributes as Html exposing (class)
import Html.Events as Html
import Html.Lazy exposing (lazy)
import Presentation.Model as Model exposing (Model)
import Presentation.Scenario as Scenario exposing (Scenario)
import Presentation.Update as Update exposing (Msg)


view : Model -> Html Msg
view model =
    wrapper
        [ header
            [ View.text "Elm Tokyo Meetup #4"
            ]
        , body
            [ lazy scenariosView model.page
            ]
        , footer
            [ pagenation
            ]
        ]



-- Helper renderer


wrapper : List (Html Msg) -> Html Msg
wrapper =
    div
        [ class "wrapper"
        ]


header : List (Html Msg) -> Html Msg
header =
    div
        [ class "header"
        ]


body : List (Html Msg) -> Html Msg
body children =
    div
        [ class "body"
        ]
        [ div
            [ class "core"
            ]
            children
        ]


footer : List (Html Msg) -> Html Msg
footer =
    div
        [ class "footer"
        ]


pagenation : Html Msg
pagenation =
    div
        [ class "pagenation"
        ]
        [ div
            [ class "backButton"
            ]
            [ View.button
                { theme = Config.Main
                }
                { state = Model.NormalButton
                }
                [ Html.onClick Update.BackPage
                ]
                [ View.text "戻る"
                ]
            ]
        , div
            [ class "forwardButton"
            ]
            [ View.button
                { theme = Config.Main
                }
                { state = Model.NormalButton
                }
                [ Html.onClick <| Update.ForwardPage scenarioLength
                ]
                [ View.text "次へ"
                ]
            ]
        ]


scenariosView : Int -> Html Msg
scenariosView n =
    View.pack <|
        List.map scenarioView <|
            List.take n Scenario.scenarios


scenarioView : Scenario -> Html Msg
scenarioView s =
    case s of
        Scenario.Question x ->
            questionView x

        Scenario.Answer icon x ->
            answerView icon x

        Scenario.Inner x ->
            innerView x


questionView : List (Html Msg) -> Html Msg
questionView =
    View.balloon
        { owner = Config.OtherBalloon
        }


answerView : Scenario.Icon -> List (Html Msg) -> Html Msg
answerView _ =
    View.balloon
        { owner = Config.MyBalloon
        }


innerView : List (Html Msg) -> Html Msg
innerView =
    View.pack



-- Helper functions


scenarioLength : Int
scenarioLength = List.length Scenario.scenarios
