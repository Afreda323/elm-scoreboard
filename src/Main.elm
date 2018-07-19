module Main exposing (main)

import App exposing (..)
import Html


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }
