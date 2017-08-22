module Presentation.Update exposing (..)

import Presentation.Model as Model exposing (Model)
import Presentation.Util as Util
import Navigation exposing (Location)


type Msg
    = OnChangeLocation Location
    | ForwardPage Int
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

        ForwardPage last ->
            let
                nextPage =
                    min last <|
                        model.page + 1
            in
                ( { model
                    | page = nextPage
                  }
                , Navigation.newUrl <| Util.toHash nextPage
                )

        BackPage ->
            let
                nextPage =
                    max 0 <|
                        model.page - 1
            in
                ( { model
                    | page = nextPage
                  }
                , Navigation.newUrl <| Util.toHash <| nextPage
                )
