module StyleGuide.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.View as View
import Html exposing (Html, div, span, text)
import Html.Attributes as Html exposing (class)


-- import Html.Lazy

import StyleGuide.Update as Update exposing (Msg)
import StyleGuide.Model as Model exposing (Model)


view : Model -> Html Msg
view model =
    View.pack
        [ View.pack
            [ colorSample "main-color0"
            , colorSample "main-color1"
            , colorSample "main-color2"
            , colorSample "main-color3"
            , colorSample "sub-color0"
            , colorSample "sub-color1"
            , colorSample "sub-color2"
            , colorSample "sub-color3"
            , colorSample "another-color0"
            , colorSample "another-color1"
            , colorSample "another-color2"
            , colorSample "another-color3"
            ]
        , View.pack
            [ View.balloon
                { owner = Config.MyBalloon
                }
                [ View.text "foo"
                ]
            , View.balloon
                { owner = Config.OtherBalloon
                }
                [ View.text "foo"
                ]
            ]
        , View.pack
            [ View.button
                { theme = Config.Main
                }
                { state = Model.NormalButton
                }
                []
                [ View.text "foo"
                ]
            , View.button
                { theme = Config.Sub
                }
                { state = Model.NormalButton
                }
                []
                [ View.text "foo"
                ]
            , View.button
                { theme = Config.Another
                }
                { state = Model.NormalButton
                }
                []
                [ View.text "foo"
                ]
            ]
        ]


colorSample : String -> Html Msg
colorSample name =
    View.pack
        [ div
            [ class "rect"
            , class name
            ]
            []
        , span
            []
            [ text name ]
        ]
