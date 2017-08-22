module Presentation.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.View as View
import Html exposing (Html)
import Html.Events as Html
import Html.Lazy exposing (lazy)
import Presentation.Model as Model exposing (Model)
import Presentation.Scenario as Scenario exposing (Scenario)
import Presentation.Update as Update exposing (Msg)


view : Model -> Html Msg
view model =
    View.pack
        [ lazy View.text <| toString model.page
        , lazy scenariosView model.page
        , View.pack
            [ View.button
                { theme = Config.Main
                }
                { state = Model.NormalButton
                }
                [ Html.onClick Update.BackPage
                ]
                [ View.text "戻る"
                ]
            , View.button
                { theme = Config.Sub
                }
                { state = Model.NormalButton
                }
                [ Html.onClick <| Update.ForwardPage
                    (List.length Scenario.scenarios)
                ]
                [ View.text "次へ"
                ]
            ]
        ]



-- Helper renderer


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
