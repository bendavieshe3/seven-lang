-module(day2).
-export([sample_dict/0]).
-export([sample_cart/0]).
-export([lookup_key/2]).
-export([total_price/1]).

sample_dict() -> [{"ruby", red}, {"sapphire", blue}].
sample_cart() -> [{pencil, 5, 0.99}, {notepad, 2, 1.99}].


lookup_key(_, []) -> io:format("Not found~n");
lookup_key(Key_to_find, [{K,V}|Others]) -> 
  %could replace this case statement with another function definition
  case K of
    Key_to_find -> V;
    _ -> lookup_key(Key_to_find, Others)
  end.


total_price(Cart) ->
  [{Item, Quantity * Price} || {Item, Quantity, Price} <- Cart].
