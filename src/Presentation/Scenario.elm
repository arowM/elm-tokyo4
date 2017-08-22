module Presentation.Scenario
    exposing
        ( Scenario(..)
        , Icon(..)
        , scenarios
        )

import Atom.View as View
import Html exposing (Html)
import Presentation.Update exposing (Msg(..))


-- Scenario


scenarios : List Scenario
scenarios =
    [ Question
        [ View.text "First Question"
        ]
    , Answer None
        [ View.text "First Answer"
        ]
    , Answer None
        [ View.text "Additional Answer"
        ]
    , Question
        [ View.text "Second Question"
        ]
    ]


type Scenario
    = Question (List (Html Msg))
    | Answer Icon (List (Html Msg))
    | Inner (List (Html Msg))


type Icon
    = None
