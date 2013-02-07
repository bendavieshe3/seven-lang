# Day 1 self-study

resources = {
    "The Ruby API" => "http://www.ruby-doc.org/core-1.9.3/",
    "Programming Ruby: The Pragmatic Programmer's Guide" => "http://www.ruby-doc.org/docs/ProgrammingRuby/",
    "A Method that substitutes part of a string" => "String::gsub at http://www.ruby-doc.org/core-1.9.3/String.html#method-i-gsub",
    "Information about Ruby's Regular Expressions" => "http://www.ruby-doc.org/core-1.9.3/Regexp.html",
    "Information about Ruby's Ranges" => "http://www.ruby-doc.org/core-1.9.3/Range.html"
}

puts "Things to Find:\n"
resources.each { |subject,answer| puts "#{subject}:\n -\t#{answer}" }
puts 

puts "Things to do:\n"

puts "Print the string 'Hello World'"
puts "\tHello, world."

puts "\nFind the occurrence of the word 'Ruby' in 'Hello, Ruby'"
puts "\t #{'Hello, Ruby'.index('Ruby')}"

puts "\nPrint your name 10 times"
10.times { puts "\tBen" }

puts "\nPrint the string 'This is sentence number x' for x  = 1..10"
(1..10).each { |i| puts "\tThis is sentence number #{i}" }

puts "\nRun a ruby program from a file:"
puts "\truby day1.rb"
