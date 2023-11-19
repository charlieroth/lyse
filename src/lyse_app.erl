%%%-------------------------------------------------------------------
%% @doc lyse public API
%% @end
%%%-------------------------------------------------------------------

-module(lyse_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    lyse_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
