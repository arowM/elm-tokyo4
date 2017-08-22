module Main exposing (..)

import Html
import StyleGuide.Model as Model exposing (Model)
import StyleGuide.Update as Update exposing (Msg(..), update)
import StyleGuide.View as View exposing (view)


-- APP


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


init : ( Model, Cmd Msg )
init =
    ( {}
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
