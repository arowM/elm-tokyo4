module Presentation.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.View as View
import Html exposing (Html, div)
import Html.Attributes as Html exposing (class)
import Html.Events as Html
import Html.Lazy exposing (lazy)
import Presentation.Model as Model exposing (Model)
import Presentation.Update as Update exposing (Msg(..))


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
            [ pagenation scenarioLength
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
        , Html.id "main"
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


pagenation : Int -> Html Msg
pagenation length =
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
                [ Html.onClick <| Update.ForwardPage length
                ]
                [ View.text "次へ"
                ]
            ]
        ]


scenariosView : Int -> Html Msg
scenariosView n =
    View.pack <|
        List.indexedMap (scenarioView n) <|
            List.take n scenarios


scenarioView : Int -> Int -> Scenario -> Html Msg
scenarioView last n s =
    case s of
        Question x ->
            questionView x

        Answer icon x ->
            answerView icon x

        Inner f ->
            innerView f (last - 1 == n)


questionView : List (Html Msg) -> Html Msg
questionView =
    View.balloon
        { owner = Config.OtherBalloon
        }


answerView : Icon -> List (Html Msg) -> Html Msg
answerView icon children =
    View.pack
        [ div
            [ class "icon"
            , class <| toString icon
            ]
            []
        , View.balloon
            { owner = Config.MyBalloon
            }
            children
        ]


innerView : (Int -> Bool -> List (Html Msg)) -> Bool -> Html Msg
innerView f =
    View.pack << f scenarioLength



-- Helper functions


scenarioLength : Int
scenarioLength = List.length scenarios



-- Scenario


scenarios : List Scenario
scenarios =
    [ Question
        [ View.text "複雑化するUIにどう立ち向かうか"
        , View.subText "Elmの思想を反映した開発方針"
        ]
    , Question
        [ View.text "自己紹介"
        ]
    , Answer None
        [ View.wrap
            [ Html.a
                [ Html.href "https://twitter.com/arowM_"
                , Html.target "_blank"
                ]
                [ Html.text "IT系魔法少女ピュアファンクショナル（arowM_）"
                ]
            ]
        ]
    , Answer None
        [ View.text "さくらちゃん（ヤギ）の身の回りのお世話をする魔法少女"
        , View.text "あまりにかわいいので1日2時間はさくらちゃんと遊んでいます"
        ]
    , imagePopup "sakura1"
    , imagePopup "sakura2"
    , imagePopup "sakura3"
    , Question
        [ View.text "今日のテーマ"
        ]
    , Answer None
        [ View.text "年々複雑さを増すWebフロントエンド"
        , View.text "複雑なUIを効率よく実現して、さくらちゃんと遊ぶ時間をつくりましょう！"
        ]
    , Question
        [ View.text "Elm最大の特徴は？"
        ]
    , Answer None
        [ View.text "言語単体としての完成度は追い求めません"
        , View.text "Elmの特徴は「目的のために最適な手段をえらぶ」こと"
        ]
    , Question
        [ View.text "たとえば？"
        ]
    , Answer None
        [ View.text "多くのAltJS は、まず言語としてイケてる存在になりたがります"
        , View.text "そのうえで、そのイケてる言語で Web フレームワークをつくろう/つかおうとします"
        ]
    , Answer None
        [ View.text "Elmにはフレームワークの選択肢が1つしかありません"
        , View.text "Elmは素晴らしい汎用言語になるのではなく"
        , View.text "Webフロントエンド制作を楽にするという「目的」を最適に実現する DSL (Domain Specific Language) です"
        ]
    , Answer None
        [ View.text "つねに目的が先にあり、そのために最適な手段を作り出していくのがElmのありかたです"
        ]
    , Question
        [ View.text "諸注意"
        ]
    , Answer None
        [ View.text "そんなElmを使うのであれば、手段にこだわらない姿勢が重要です"
        , View.text "今日ご紹介する手法も、つくるものが変われば最適解ではなくなります"
        , View.text "まず、目的から考えることがElmの思想を体現することにつながります"
        ]
    , Answer None
        [ View.text "発表でコードはあまりでてきませんが、この資料のコード自体が実例です"
        , View.wrap
            [ Html.a
                [ Html.href "https://github.com/arowM/elm-tokyo4"
                , Html.target "_blank"
                ]
                [ Html.text "コード"
                ]
            , Html.text "がGitHubに公開されているので、興味がある方は見てください"
            ]
        ]
    , Question
        [ View.text "実際に問題を解決してみよう！"
        ]
    , Answer None
        [ View.text "この吹き出しを実装することを考えます"
        ]
    , Answer None
        [ View.text "1. 処理中（に見せかけた）のUI"
        , View.text "2. メッセージをにゅぅっとだす"
        , View.text "これらの状態管理とアニメーションを実現します"
        ]
    , Question
        [ View.text "どうやって状態管理とアニメーションをElmで実現するか？"
        ]
    , Answer None
        [ View.text "..."
        ]
    , Answer None
        [ View.text "さっき言ったじゃないですか"
        , View.text "「手段にこだわらない」って"
        ]
    , Answer None
        [ View.text "Elmで実現する必要はないです"
        ]
    , Answer None
        [ View.text "Elmに限らず、Flux系の設計でこういった状態管理は大変骨が折れます"
        , View.wrap
            [ Html.text "Elmの場合は"
            , Html.a
                [ Html.href "https://github.com/thebritican/elm-autocomplete"
                , Html.target "_blank"
                ]
                [ Html.text "elm-autocomplete"
                ]
            , Html.text "や"
            , Html.a
                [ Html.href "https://github.com/evancz/elm-sortable-table"
                , Html.target "_blank"
                ]
                [ Html.text "elm-sortable-table"
                ]
            , Html.text "のような設計になりますが、くっそめんどくさいです"
            ]
        ]
    , Question
        [ View.text "じゃあどうやったの？"
        ]
    , Answer None
        [ View.text "吹き出しの状態をシステム全体が知る必要はないので"
        , View.text "* SVGアニメーション"
        , View.text "* CSSアニメーション"
        , View.text "をつかいました"
        ]
    , Answer None
        [ View.text "CSSアニメーションで一定時間後に状態が変わるように設定しています"
        , View.text "なめられがちなCSSだけど、実はすごい"
        ]
    , Answer None
        [ View.text "グローバルには知る必要のない情報が、Viewの中で完結しました"
        ]
    , Question
        [ View.text "elm-css-modules-loader について"
        ]
    , Answer None
        [ View.text "ElmでCSS modulesをつかえるようになります"
        ]
    , Answer None
        [ View.text "もう資料がないです"
        ]
    ]


type Scenario
    = Question (List (Html Msg))
    | Answer Icon (List (Html Msg))
    | Inner (Int -> Bool -> List (Html Msg))


type Icon
    = None


-- Helper functions


imagePopup : String -> Scenario
imagePopup str =
    Inner <| \length show ->
        [ View.popup
          { show = show
          }
          [ div
            [ class "imagePopup"
            ]
            [ div
                [ class str
                ]
                []
            , pagenation length
            ]
          ]
        ]
