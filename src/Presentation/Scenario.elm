module Presentation.Scenario
    exposing
        ( Scenario(..)
        , Icon(..)
        , scenarios
        )

import Atom.View as View
import Html exposing (Html)
import Html.Attributes as Html
import Presentation.Update exposing (Msg(..))


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
                ]
                [ Html.text "IT系魔法少女ピュアファンクショナル（arowM_）"
                ]
            ]
        ]
    , Answer None
        [ View.text "さくらちゃん（ヤギ）の身の回りのお世話をする魔法少女"
        , View.text "あまりにかわいいので1日2時間はさくらちゃんと遊んでいます"
        ]
    -- , Inner <| \show ->
    --     [ View.popup
    --       (View.text "foo")
    --       { show = show
    --       }
    --     ]
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
                ]
                [ Html.text "elm-autocomplete"
                ]
            , Html.text "や"
            , Html.a
                [ Html.href "https://github.com/evancz/elm-sortable-table"
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
    | Inner (Bool -> List (Html Msg))


type Icon
    = None
