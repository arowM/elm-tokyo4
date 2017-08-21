module Atom.Config exposing (..)

import Monocle.Lens exposing (Lens)


-- Balloon


type alias Balloon =
    { owner : BalloonOwner
    }


type BalloonOwner
    = MyBalloon
    | OtherBalloon


owner : Lens { x | owner : a } a
owner =
    let
        get =
            .owner

        set v a =
            { a
                | owner = v
            }
    in
        Lens get set
