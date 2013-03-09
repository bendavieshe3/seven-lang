"Day 1" println

"\nFinding:" println
"--------\n" println 
"Some IO Example Problems: pass " println
"An IO community that will answer questions: http://tech.groups.yahoo.com/group/iolanguage/" println
"A Style guide with Io Idioms: http://en.wikibooks.org/wiki/Io_Programming/Io_Style_Guide" println

"" println

"\nAnswer:" println
"-------\n" println 
"Is IO Strongly or weakly typed? Weakly. see code" println
typeExample := Object clone
typeExample exampleSlot := 1
typeExample exampleSlot println
typeExample exampleSlot := "One"
typeExample exampleSlot println

truthExample := Object clone
truthExample zeroIsTrue := 0 and true
truthExample emptyStringIsTrue := "" and true
truthExample nilIsTrue := nil and true 
"Truth value of 0 is TRUE. Truth value of empty string is TRUE. Nil is FALSE. See code" println




