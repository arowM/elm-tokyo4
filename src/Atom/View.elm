module Atom.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.Style as Style
import Html exposing (Attribute, Html, div, span)
import Html.Attributes exposing (attribute, disabled, type_)


-- Packer


pack : List (Html msg) -> Html msg
pack children =
    div
        [ .class Style.common .pack ]
        children



-- Text


text : String -> Html msg
text str =
    span
        []
        [ Html.text str
        ]



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



-- Button


button : Config.Button -> Model.Button -> List (Attribute msg) -> List (Html msg) -> Html msg
button config model attrs children =
    div
        [ .class Style.button .wrap
        ]
        [ Html.button
            (List.concat
                [ [ type_ "button"
                  , .class Style.button .core
                  , .class Style.button <|
                        case config.theme of
                            Config.Main ->
                                .main

                            Config.Sub ->
                                .sub

                            Config.Another ->
                                .another
                  ]
                , case model.state of
                    Model.BusyButton ->
                        [ attribute "aria-busy" "true"
                        , disabled True
                        ]

                    Model.InvalidButton ->
                        [ attribute "aria-invalid" "true"
                        , disabled True
                        ]

                    _ ->
                        []
                , attrs
                ]
            )
            children
        ]
