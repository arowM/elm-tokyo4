module Atom.View exposing (..)

import Atom.Config as Config
import Atom.Style as Style
import Html exposing (Html, div)
import Html.Attributes exposing (attribute)


-- Packer


pack : List (Html msg) -> Html msg
pack children =
    div
        [ .class Style.common .pack ]
        children



-- Balloon


balloon : Config.Balloon -> List (Html msg) -> Html msg
balloon config children =
    div
        [ .class Style.balloon .wrap
        , .class Style.balloon <|
            case config.owner of
                Config.MyBalloon ->
                    .myBalloon

                Config.OtherBalloon ->
                    .otherBalloon
        ]
        [ div
            [ .class Style.balloon .core
            ]
            [ div
                [ .class Style.balloon .body
                ]
                children
            ]
        ]
