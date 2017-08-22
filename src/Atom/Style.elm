module Atom.Style exposing (..)

import CssModules exposing (css)


common =
    css "../Atom/styles/common.scss"
        { pack = ""
        , wrap = ""
        , inline = ""
        , top = ""
        , middle = ""
        , bottom = ""
        , subText = ""
        }



-- Balloon


balloon =
    css "../Atom/styles/balloon.scss"
        { wrap = ""
        , myBalloon = ""
        , otherBalloon = ""
        , core = ""
        , body = ""
        }


button =
    css "../Atom/styles/button.scss"
        { wrap = ""
        , core = ""
        , main = ""
        , sub = ""
        , another = ""
        }


popup =
    css "../Atom/styles/popup.scss"
        { wrapper = ""
        , centerBox = ""
        , background = ""
        }
