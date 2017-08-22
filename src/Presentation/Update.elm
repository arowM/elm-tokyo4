module Presentation.Update exposing (..)

import Presentation.Model as Model exposing (Model)
import Presentation.Util as Util
import Navigation exposing (Location)


type Msg
    = OnChangeLocation Location
    | ForwardPage
    | BackPage


update : Msg -> Model -> ( Model, Cmd Msg )
update action model =
    case action of
        OnChangeLocation { hash } ->
            ( { model
                | page =
                    case Util.parseHash hash of
                        Just x ->
                            x

                        Nothing ->
                            model.page
              }
            , Cmd.none
            )

        ForwardPage ->
            ( { model
                | page = model.page + 1
              }
            , Navigation.newUrl <| Util.toHash <| model.page + 1
            )

        BackPage ->
            ( { model
                | page = model.page - 1
              }
            , Navigation.newUrl <| Util.toHash <| model.page - 1
            )
