module StyleGuide.View exposing (..)

import Html exposing (Html, div, span, text)
import Html.Attributes as Html exposing (class)
-- import Html.Lazy
import StyleGuide.Update as Update exposing (Msg)
import StyleGuide.Model as Model exposing (Model)


view : Model -> Html Msg
view model =
    div
        [ class "wrapper"
        ]
        [ colorSample "main-color0"
        , colorSample "main-color1"
        , colorSample "main-color2"
        , colorSample "sub-color0"
        , colorSample "sub-color1"
        , colorSample "sub-color2"
        , colorSample "another-color0"
        , colorSample "another-color1"
        , colorSample "another-color2"
        ]


colorSample : String -> Html Msg
colorSample name =
  div
    [ class "wrapper"
    ]
    [ div
        [ class "rect"
        , class name
        ]
        []
    , span
        []
        [ text name ]
    ]
