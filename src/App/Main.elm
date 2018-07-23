module Main exposing (main)

import Html exposing (beginnerProgram)
import Model exposing (Model, model)
import Update exposing (Msg, update)
import View exposing (view)


main : Program Never Model Msg
main =
    beginnerProgram
        { model = model
        , view = view
        , update = update
        }
