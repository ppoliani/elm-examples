module Compose exposing (..)

import Html exposing (Html, div)
import Html.App
import Widget

-- Model
type alias AppModel = {widgetModel: Widget.Model}

initialModel: AppModel
initialModel = {widgetModel = Widget.initialModel}

init: (AppModel, Cmd Msg)
init = (initialModel, Cmd.none)

-- Message
type Msg = WidgetMsg Widget.Msg

-- View

view: AppModel -> Html Msg
view model = 
    div []
        [ Html.App.map WidgetMsg (Widget.view model.widgetModel) ]

-- Update 
update: Msg -> AppModel -> (AppModel, Cmd Msg)
update msg model =
    case msg of 
        WidgetMsg subMsg -> let (updatedWidgetModel, widgetCmd) = Widget.update subMsg model.widgetModel in 
            ({model | widgetModel = updatedWidgetModel}, Cmd.map WidgetMsg widgetCmd)

-- Subscriptions
subscriptions: AppModel -> Sub Msg
subscriptions model = Sub.none

main: Program Never
main = 
    Html.App.program 
        {init = init,
        view = view,
        update = update,
        subscriptions=subscriptions}
        
