-module(day3).

% find An OTP service that will restart a process if it dies
%   Supervisor module/behaviour: 
%     http://www.erlang.org/doc/design_principles/sup_princ.html
%     http://www.erlang.org/doc/man/supervisor.html

% Find Documentation for building a simple OTP server
%   I went with trying to find a Simple HTTP server implementation, and found one 
%   At StackOverflow: http://stackoverflow.com/questions/2206933/how-to-write-a-simple-webserver-in-erlang
%   More of a tutorial: http://blog.foemmel.com/2008/05/hello-world-webapp-in-erlang.html

% Monitor the translate_service and restart it should it die.