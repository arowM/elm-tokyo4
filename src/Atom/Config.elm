module Atom.Config exposing (..)

-- Alignment


type alias Inline =
    { align : VerticalAlign
    }


type VerticalAlign
    = Top
    | Middle
    | Bottom



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
