#we have the students in an array
# students = [
# {name: "Dr. Hannibal Lecter",cohort :november},
# {name: "Darth Vader",cohort :november},
# {name: "Nurse Ratched",cohort :november},
# {name: "Michael Corleone",cohort :november},
# {name: "Alex DeLarge",cohort :november},
# {name: "The Wicked Witch of the West",cohort :november},
# {name: "Terminator",cohort :november},
# {name: "Freddy Krueger",cohort :november},
# {name: "The Joker",cohort :november},
# {name: "Joffrey Baratheon",cohort :november},
# {name: "Norman Bates",cohort :november},
# {name: "The one that putted HL and The Joker as villians, they are true heroes",cohort :november}]
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

def input_students
  #first we ask for the names
  puts "Please dear user, write the name of a student and press return"
  puts "Once you have finished adding names press return twice"
  #We need an empty array for the students
  students = []
  #We get each name
  name = gets.chomp

  #We need to repeat the code while the name isn't empty

  while !name.empty? do
    #We add the students to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #and we ask for names again
    name = gets.chomp
  end
  #return the array of students
students

end

students = input_students
print_head
print_students(students)
print_footer(students)
