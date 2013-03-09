-module(day1).
-export([word_count/1]).
-export([count_to/1]).
-export([print_result/1]).

% erlang's official site is http://erlang.org
% official documentation for erlangs function library can be found at 
%   http://erlang.org/doc/man/erlang.html
% Erlang OTP documentation is at http://www.erlang.org/doc/


% Write a function that uses recursion to count the number of words in a string
word_count("") -> 0;
word_count([32|Tail]) -> word_count(Tail);
word_count(String) ->
  1 + word_count(lists:dropwhile(fun(E) -> E =/= 32 end, String)).

% Write a function to count to ten (using recursion)
count_to(X) -> counting(0, X).
counting(Finish, Finish) -> io:format("~w~n", [Finish]);
counting(Next, To) -> io:format("~w " ,[Next]), counting(Next + 1, To).

% Write a function to print "sucess" or "Error: message"
print_result(success) -> io:format("Success~n");
print_result({error, Message}) -> io:format("Error: ~s~n", [Message]).

