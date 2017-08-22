module Presentation.Model exposing (..)

import Monocle.Lens exposing (Lens)


type alias Model =
    { page : Int
    }


page : Lens { x | page : a } a
page =
    let
        get =
            .page

        set v a =
            { a
                | page = v
            }
    in
        Lens get set
