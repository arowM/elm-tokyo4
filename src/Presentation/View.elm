module Presentation.View exposing (..)

import Atom.Config as Config
import Atom.Model as Model
import Atom.View as View
import Html exposing (Html)
import Html.Events as Html
import Html.Lazy exposing (lazy)
import Presentation.Model as Model exposing (Model)
import Presentation.Update as Update exposing (Msg)


view : Model -> Html Msg
view model =
    View.pack
        [ lazy View.text <| toString model.page
        , View.button
            { theme = Config.Main
            }
            [ Html.onClick Update.ForwardPage
            ]
            [ View.text "次へ"
            ]
            { state = Model.NormalButton
            }
        ]
