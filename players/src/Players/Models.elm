module Players.Models exposing (..)

type alias PlayerId = Int

type alias Player = 
    { id: PlayerId
    , name: String
    , level: Int}

create: Player
create = 
    { id=0
    , name=""
    , level=1}

