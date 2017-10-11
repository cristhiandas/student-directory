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

#I've created a class method that will return the initial of any word (ty stackoverflow)
class String
  def initial
    self[0,1]
  end
end
#We create a head-printer method
def print_head
  puts "The Students of The Villian Academy"
  puts "----------------------------"
end

#Now an students-printer method with index and the initial
# def print_students(names)
#   names.each_with_index do |name, index|
#     puts "#{index+1}. #{name[:name]} (#{name[:cohort]} cohort)" if name[:name].initial.downcase == "m"
#   end
# end

#We print the studentes name with less than 12 char
# def print_students(names)
#   names.each do |name|
#     puts "#{name[:name]} (#{name[:cohort]} cohort)" if name[:name].length < 12
#   end
# end

#We print the students names with a while loop instead of a each iterator
# def print_students(names)
#   index = 0
#   while index < names.length
#     puts "#{names[index][:name]} #{names[index][:cohort]}"
#     index += 1
#   end
# end

#We print the studentes name, hobbies, country_of_birth, etc
def print_students(names)
  names.each do |name|
     puts "#{name[:name]} \nHeight: #{name[:height]}\nHobbies: #{name[:hobbies]}\nCountry of Birth: #{name[:country_of_birth]}\nOther Info: #{name[:relevant_info]} \n(#{name[:cohort]} cohort)"
   end
 end

#Now the print the sum of the students method
def print_footer(names)
    puts "Overall, we have #{names.count} great students \n"
end

def input_students
  #first we ask for the names
  puts "Please dear user, write the name of a student and press return"

  #We need an empty array for the students
  students = []

  #We get the first name
  name = gets.chomp

  #We need to repeat the code while the name isn't empty
  while !name.empty? do
    #Now we add the Info
    puts "please, write the student's hobbies, if doesn't have any write N/A"
    hobbies = gets.chomp
    puts "please, write the student's country of birth"
    country_of_birth = gets.chomp
    puts "please, write the student's height"
    height = gets.chomp
    puts "please, write any other relevant info, if doesn't have any write N/A"
    relevant_info = gets.chomp
    #We add the students to the array
    students << {name: name,hobbies: hobbies, country_of_birth: country_of_birth, height: height, relevant_info: relevant_info, cohort: :november}
    puts "Now we have #{students.count} students"
    #and we ask for names again
    puts "Now you can add another name or return to finish the program"
    name = gets.chomp
  end
  #return the array of students
students

end

students = input_students
print_head
print_students(students)
print_footer(students)
