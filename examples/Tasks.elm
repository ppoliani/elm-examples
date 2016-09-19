module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.App
import Http
import Task exposing (Task)
import Json.Decode as Decode 

-- Model
type alias Model = String

init = ("", Cmd.none)

-- Messages

type Msg = 
    Fetch
    | FetchSuccess String
    | FetchError Http.Error

-- View
view model = 
    div []
        [ button [onClick Fetch] [text "Fetch"]
        , text model]

decode = 
    Decode.at ["name"] Decode.string

url = "https://swapi.co/api/planets/1/?format=json"

fetchTask = Http.get decode url
fetchCmd = Task.perform FetchError FetchSuccess fetchTask

-- Update
update msg model = 
    case msg of
        Fetch -> (model, fetchCmd)
        FetchSuccess name -> (name, Cmd.none)
        FetchError error -> (toString error, Cmd.none)


main = 
    Html.App.program 
        { init=init 
        , view=view
        , update=update
        , subscriptions = (always Sub.none)}
