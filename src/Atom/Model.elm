module Atom.Model exposing (..)

import Monocle.Lens exposing (Lens)


-- Button


type alias Button =
    { state : ButtonState
    }


type ButtonState
    = NormalButton
    | BusyButton
    | InvalidButton


state : Lens { x | state : a } a
state =
    let
        get =
            .state

        set v a =
            { a
                | state = v
            }
    in
        Lens get set
