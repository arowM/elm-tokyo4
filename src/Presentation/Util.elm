module Presentation.Util exposing (..)

import Regex exposing (HowMany(..), regex, replace)


{-|
    parseHash "#page-1"
    --> Just 1

    parseHash "#page-01"
    --> Just 1

    parseHash "#page01"
    --> Nothing

    parseHash "#1"
    --> Just 1

    parseHash "#foo"
    --> Nothing

-}
parseHash : String -> Maybe Int
parseHash str =
    let
        bare : String
        bare =
            replace (AtMost 1) (regex "^page-") (\_ -> "") <|
                replace (AtMost 1) (regex "^#") (\_ -> "") str
    in
        case String.toInt bare of
            Ok n ->
                Just n

            _ ->
                Nothing


toHash : Int -> String
toHash n =
    "#page-" ++ toString n
