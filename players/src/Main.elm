module Main exposing (..)

import Html.App

import Messages exposing (Msg)
import Models exposing (Model, initialModel)
import View exposing (view)
import Update exposing (update)
import Messages exposing (Msg(..))
import Players.Commands exposing (fetchAll)

init: (Model, Cmd Msg)
init = (initialModel, Cmd.map PlayersMsg fetchAll)

-- Subscriptions 
subscriptions: Model -> Sub Msg
subscriptions model = Sub.none

-- Main
main = Html.App.program 
    { init=init
    , view=view 
    , update=update
    , subscriptions=subscriptions}
