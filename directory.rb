#we have the students in an array
students = [
"Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex DeLarge",
"The Wicked Witch of the West",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates",
"The one that putted HL and The Joker as villians, they are true heroes"]
#Now, we print it
puts "The Students of The Villian Academy"
puts "----------------------------"
students.each do |student|
  puts student
end
#Now we print the sum of the students
print "Overall, we have #{students.count} great students"
