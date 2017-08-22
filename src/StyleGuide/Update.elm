module StyleGuide.Update exposing (..)

import StyleGuide.Model as Model exposing (Model)


-- import Monocle.Lens


type Msg
    = Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        Msg ->
            ( model
            , Cmd.none
            )
