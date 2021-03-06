module Atom.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.Style as Style
import Html exposing (Attribute, Html, div)
import Html.Attributes exposing (attribute, disabled, type_)


-- Packer


pack : List (Html msg) -> Html msg
pack children =
    div
        [ .class Style.common .pack ]
        children


wrap : List (Html msg) -> Html msg
wrap children =
    div
        [ .class Style.common .wrap ]
        children



-- Alignment


inline : Config.Inline -> List (Html msg) -> Html msg
inline config children =
    div
        (List.concat
            [ [ .class Style.common .inline
              ]
            , case config.align of
                Config.Top ->
                    [ .class Style.common .top
                    ]

                Config.Middle ->
                    [ .class Style.common .middle
                    ]

                Config.Bottom ->
                    [ .class Style.common .bottom
                    ]
            ]
        )
        children



-- Text


text : String -> Html msg
text str =
    div
        []
        [ Html.text str
        ]


subText : String -> Html msg
subText str =
    div
        [ .class Style.common .subText ]
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



-- Popup


popup : Model.Popup -> List (Html msg) -> Html msg
popup model children =
    div
        [ .class Style.popup .wrapper
        , attribute "aria-hidden" <|
            case model.show of
                True ->
                    "false"

                _ ->
                    "true"
        ]
        [ div
            [ .class Style.popup .background
            ]
            []
        , div
            [ .class Style.popup .centerBox
            ]
            children
        ]
