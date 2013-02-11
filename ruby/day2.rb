# 2 Day 1 self-study

puts "Day 2 self-study"

puts "1. Accessing the file system with and without a code block"

file = File.open('test.txt', 'w')
file.puts "Without a code block you are responsible for closing the file when you are finished with it"
file.close

File.open('test.txt', 'a')  do | file |
  file.puts "With a code block, the file is automatically closed at the end of the block"
end

puts "2a. Translate a hash into an array of arrays like this:"
hash = { a:1, b:2, c:3}
array_of_hash = []
hash.each do |k,v|
  array_of_hash << [k,v]
end
puts array_of_hash.inspect

puts "2b. Arrays can be translated into hashes by chosing number keys corresponding with the array indexes:"

a = [1,nil,10,20]
h = {}
a.each_with_index {|i, index|
  h[index] = i
}
puts h.inspect

puts "3. Yes you can iterate through a hash using the iteration methods like each:"
h.each {|k,v| puts "#{k} : #{v}"}

puts "Ruby arrays support stacks, fifo queues, sets, "
puts "stacks: push() #{a.push 1}, pop() #{a.pop}"
puts "queue: shift() #{a.shift}, push() #{a.push(1)}"

20.times { a << rand(9)+1 } 
puts a.inspect


puts "\ndo1:\n\n"
a = []
16.times { a << rand(9) + 1}

j = 0
a.each do |i|
  j += 1 
  print i.to_s + ' ' 
  print "\n" if j%4==0 
end

a.each_slice(4)  {|g| puts g.inspect }

require File.join(File.dirname(__FILE__), 'data_structures')

puts "\ndo2:\n\n"

tree = Tree.new 'grandpa' => { 'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } 
tree.visit_all { |n| puts n.node_name }

puts "\ndo3:\n\n"

phrase = "owl"
file = "sample_grep_file.txt"

File.open(file, 'r') do | f |
  l = 0
  f.each do |line| 
    l += 1
    puts "#{l}: #{line}" if line.include?(phrase)
  end
end



