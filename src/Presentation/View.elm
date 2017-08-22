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
            [ Html.onClick Update.ForwardPage
            ]
            [ View.text "次へ"
            ]
        ]
