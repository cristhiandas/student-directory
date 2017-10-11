#we have the students in an array
students = [
{name: "Dr. Hannibal Lecter",cohort :november},
{name: "Darth Vader",cohort :november},
{name: "Nurse Ratched",cohort :november},
{name: "Michael Corleone",cohort :november},
{name: "Alex DeLarge",cohort :november},
{name: "The Wicked Witch of the West",cohort :november},
{name: "Terminator",cohort :november},
{name: "Freddy Krueger",cohort :november},
{name: "The Joker",cohort :november},
{name: "Joffrey Baratheon",cohort :november},
{name: "Norman Bates",cohort :november},
{name: "The one that putted HL and The Joker as villians, they are true heroes",cohort :november}]
#We create a head-printer method

def print_head
  puts "The Students of The Villian Academy"
  puts "----------------------------"
end

#Now an students-printer method
def print_students(names)
  names.each do |name|
    puts "#{name[:name]} (#{name[:cohort]} cohort)"
  end
end

#Now the print the sum of the students method
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

print_head
print_students(students)
print_footer(students)
