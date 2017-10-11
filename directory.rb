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
#We create a head-printer method

def print_head
  puts "The Students of The Villian Academy"
  puts "----------------------------"
end

#Now an students-printer method
def print_students(names)
  names.each do |name|
    puts name
  end
end

#Now the print the sum of the students method
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

print_head
print_students(students)
print_footer(students)
