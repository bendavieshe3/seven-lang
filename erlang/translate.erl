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
  Me = self(),
  link(Me),
  receive
    {monitor, Process} ->
      link(Process),
      io:format("Monitoring translation service.~n"),
      translate_doctor();

    % Q2--------------------------------  
    {'EXIT', Me, Reason} ->
      io:format("Doctor service ~p died with reason ~p.~n", [Me, Reason]),
      spawn(fun translate_doctor/0),
      io:format("Starting Doctor...~n");
    % /Q2-------------------------------

    {'EXIT', Translator, Reason} ->
      io:format("Translation service ~p died with reason ~p.~n", [Translator, Reason]),
      self() ! {monitor, spawn(fun translate_service/0)},
      io:format("Starting Translation Service...~n"),  
      translate_doctor();
    {die} ->
      exit(told_to_die)
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
  io:format("~n"),

  % Q2 ------------------
  Doctor ! die,
  io:format(translate(Translator, "blanca")),
  io:format("~n").  
  % Q2 ------------------

