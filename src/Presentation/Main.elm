module Main exposing (..)

import Keyboard
import Navigation exposing (Location)
import Presentation.Model as Model exposing (Model)
import Presentation.Update as Update exposing (Msg(..), update)
import Presentation.Util as Util
import Presentation.View as View exposing (view)


-- APP


main : Program Never Model Msg
main =
    Navigation.program
        Update.OnChangeLocation
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- Model


init : Location -> ( Model, Cmd Msg )
init { hash } =
    ( { page =
            case Util.parseHash hash of
                Just x ->
                    x

                Nothing ->
                    1
      }
    , Cmd.none
    )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ Keyboard.downs (Update.OnKeydown (List.length View.scenarios))
        ]
