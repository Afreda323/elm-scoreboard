module Model exposing (..)

-- model


type alias Model =
    { players : List Player
    , name : String
    , playerId : Maybe Int
    , plays : List Play
    }


type alias Player =
    { id : Int
    , name : String
    , points : Int
    }


type alias Play =
    { id : Int
    , playerId : Int
    , name : String
    , points : Int
    }


model : Model
model =
    { players = []
    , name = ""
    , playerId = Nothing
    , plays = []
    }
