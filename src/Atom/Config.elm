module Atom.Config exposing (..)


-- Balloon


type alias Balloon =
    { owner : BalloonOwner
    }


type BalloonOwner
    = MyBalloon
    | OtherBalloon



-- Button


type alias Button =
    { theme : Theme
    }



-- Theme


type Theme
    = Main
    | Sub
    | Another
