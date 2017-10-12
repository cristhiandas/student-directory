#I've created a class method that will return the initial of any word (ty stackoverflow)
class String
  def initial
    self[0,1]
  end
end
#We create a head-printer method
def print_head
  puts "The Students of The Villian Academy".center(80)
  puts "----------------------------".center(80)
end


#We print the studentes name
def print_students(names)
  names.each do |name|
     puts "#{name[:name]} (#{name[:cohort]} cohort)".center(80)
   end
 end

#Now the print the sum of the students method
def print_footer(names)
    puts "Overall, we have #{names.count} great students \n".center(80)
end

#This method will ask for a cohort to select, if empty will select november by default, if it have a typo
#It will show a wrong input message
def input_cohort
#first we need an array for the cohorts, we want them to be symbols
choosen_cohort = [:January,
:February,
:March,
:April,
:May,
:June,
:July,
:August,
:September,
:October,
:November,
:December
]
  puts "Now Choose the cohort, please write ONLY the number of the cohort you want".center(60)
  puts "1 January       2 February        3 March         4 April            5 May         6 June".center(60)
  puts "7 July          8 August        9 September      10 October      11 November   12 December".center(60)
#We get the text, we change it to Integer because it will have less
  cohort = gets.chomp
  if cohort.empty?
    return choosen_cohort[10]
  elsif 0 < cohort.to_i && cohort.to_i < 13
    return choosen_cohort[cohort.to_i-1]
  else
    puts "Wrong input, try again"
    input_cohort
  end
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

      students << {name: name, cohort: input_cohort}
      puts "hello 6"
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
