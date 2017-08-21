module Atom.Style exposing (..)

import CssModules exposing (css)


common =
    css "../Atom/styles/common.scss"
        { pack = ""
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
