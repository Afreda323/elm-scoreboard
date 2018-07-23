module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Model exposing (Model, Play, Player)
import Update exposing (..)


-- view


view : Model -> Html Msg
view model =
    div [ class "scoreboard" ]
        [ h1 []
            [ text "Score Keeper" ]
        , playerSection model
        , playerForm model
        , playSection model
        ]


playerSection : Model -> Html Msg
playerSection model =
    div []
        [ playerListHeader
        , playerList model
        , pointTotal model
        ]


playerListHeader : Html Msg
playerListHeader =
    header []
        [ div []
            [ text "Name" ]
        , div []
            [ text "Points" ]
        ]


playerList : Model -> Html Msg
playerList model =
    model.players
        |> List.sortBy .name
        |> List.map player
        |> ul []


player : Player -> Html Msg
player player =
    li []
        [ i
            [ class "fa fa-edit", onClick (Edit player) ]
            []
        , div
            []
            [ text player.name ]
        , button
            [ type_ "button", class "pure-button pure-button-primary", onClick (Score player 2) ]
            [ text "2pt" ]
        , button
            [ type_ "button", class "pure-button pure-button-primary", onClick (Score player 3) ]
            [ text "3pt" ]
        , div
            []
            [ text (toString player.points) ]
        ]


pointTotal : Model -> Html Msg
pointTotal model =
    let
        total =
            List.map .points model.plays |> List.sum
    in
    footer
        []
        [ div [] [ text "Total:" ]
        , div [] [ text (toString total) ]
        ]


playerForm : Model -> Html Msg
playerForm model =
    Html.form [ onSubmit Save ]
        [ input
            [ type_ "text"
            , placeholder "Add/Edit Player"
            , onInput Input
            , value model.name
            ]
            []
        , button [ type_ "submit", class "pure-button pure-button-primary" ]
            [ text "Save" ]
        , button [ type_ "button", class "pure-button", onClick Cancel ]
            [ text "Cancel" ]
        ]


playSection : Model -> Html Msg
playSection model =
    div []
        [ playListHeader
        , playList model
        ]


playListHeader : Html Msg
playListHeader =
    header []
        [ div []
            [ text "Plays" ]
        , div
            []
            [ text "Points" ]
        ]


playList : Model -> Html Msg
playList model =
    model.plays
        |> List.map play
        |> ul []


play : Play -> Html Msg
play play =
    li []
        [ i [ class "fa fa-remove", onClick (DeletePlay play) ] []
        , div [] [ text play.name ]
        , div [] [ text (toString play.points) ]
        ]
