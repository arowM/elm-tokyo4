module Presentation.Update exposing (..)

import Dom as Dom
import Dom.Scroll as Dom
import Keyboard
import Navigation exposing (Location)
import Presentation.Model as Model exposing (Model)
import Presentation.Util as Util
import Task


type Msg
    = OnChangeLocation Location
    | OnKeydown Int Keyboard.KeyCode
    | ForwardPage Int
    | BackPage
    | Null


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
            , Task.attempt
                (\_ -> Null)
                (Dom.toBottom "main")
            )

        OnKeydown last key ->
            case key of
                13 ->
                    forwardPage last model

                39 ->
                    forwardPage last model

                37 ->
                    backPage model

                _ ->
                    ( model, Cmd.none )

        ForwardPage last ->
            forwardPage last model

        BackPage ->
            backPage model

        Null ->
            ( model, Cmd.none )


forwardPage : Int -> Model -> ( Model, Cmd Msg )
forwardPage last model =
    let
        nextPage =
            min last <|
                model.page
                    + 1
    in
        ( { model
            | page = nextPage
          }
        , Navigation.newUrl <| Util.toHash nextPage
        )


backPage : Model -> ( Model, Cmd Msg )
backPage model =
    let
        nextPage =
            max 0 <|
                model.page
                    - 1
    in
        ( { model
            | page = nextPage
          }
        , Navigation.newUrl <| Util.toHash <| nextPage
        )
