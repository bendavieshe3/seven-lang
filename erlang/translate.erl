-module(translate).
-export([translate_service/0]).
-export([translate/2]).
-export([test/0]).

translate_service() ->
  receive
    {From, "casa"} ->
      From ! "house",
      translate_service();
    {From, "blanca"} ->
      From ! "white",
      translate_service();
    {_, _} ->
      exit(unknown_word)
  end.

translate_doctor() ->
  process_flag(trap_exit, true),
  receive
    {monitor, Process} ->
      link(Process),
      io:format("Monitoring translation service.~n"),
      translate_doctor();
    {'EXIT', From, Reason} ->
      io:format("Translation service ~p died with reason ~p.", [From, Reason]),
      self() ! {monitor, spawn(fun translate_service/0)},
      translate_doctor()
  end.

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.

test() ->
  Translator = spawn(fun translate_service/0),
  Doctor = spawn(fun translate_doctor/0),
  Doctor ! {monitor, Translator},
  io:format(translate(Translator, "casa")),
  io:format("~n"),
  io:format(translate(Translator, "blanca")),
  io:format("~n"),
  io:format(translate(Translator, "weird word")),
  io:format("~n"),
  io:format(translate(Translator, "blanca")),
  io:format("~n").

