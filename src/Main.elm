module Main exposing (Model, Msg(..), main, update, view)

import Browser
import Counter
import ElmUICounter
import HelloWorld
import Html


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { counterModel : Counter.Model
    , elmUiCounterModel : ElmUICounter.Model
    }


type Msg
    = NoOp
    | CounterMsg Counter.Msg
    | ElmUICounterMsg ElmUICounter.Msg


init : Model
init =
    { counterModel = Counter.init
    , elmUiCounterModel = ElmUICounter.init
    }


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        CounterMsg subMsg ->
            { model | counterModel = Counter.update subMsg model.counterModel }

        ElmUICounterMsg subMsg ->
            { model | elmUiCounterModel = ElmUICounter.update subMsg model.elmUiCounterModel }


view : Model -> Html.Html Msg
view model =
    Html.div []
        [ HelloWorld.view
        , Html.br [] []
        , Html.map CounterMsg <| Counter.view model.counterModel
        , Html.br [] []
        , Html.map ElmUICounterMsg <| ElmUICounter.view model.elmUiCounterModel
        ]
