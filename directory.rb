#We create a head-printer method
def print_head
  puts "The Students of The Villian Academy".center(80)
  puts "----------------------------".center(80)
end

#Now the print the sum of the students method
def print_footer(names)
  if names.count ==1
    puts "Overall, we have #{names.count} great student \n".center(80)
  else
    puts "Overall, we have #{names.count} great students \n".center(80)
  end
end


def input_students(choosen_cohort)
  #first we ask for the names
  puts "Please dear user, write the name of a student and press return"
  puts "if you want to go back to the menu, press return"

  #We need an empty array for the students
  students = []

  #We get the first name
  name = gets.chomp

  #if no names, it'll return nill
  return nil if name.empty?

  #We need to repeat the code while the name isn't empty
  while !name.empty? do

    students << {name: name, cohort: input_cohort(choosen_cohort)}

    if students.count != 1
      puts "Now we have #{students.count} students"
    else
      puts "Now we have #{students.count} student"
    end

    #and we ask for names again
    puts "Now you can add another name or press return to go back to the menu"
    name = gets.chomp

  end
  #return the array of students
students

end


#This method will ask for a cohort to select, if empty will select november by default, if it have a typo
#It will show a wrong input message


def input_cohort(choosen_cohort)
  puts "Choose the cohort, please write ONLY the number of the cohort you want".center(60)
  puts "1 January       2 February        3 March         4 April            5 May         6 June".center(60)
  puts "7 July          8 August        9 September      10 October      11 November   12 December".center(60)
#We get the number of the cohort
  cohort = gets.chomp
  puts "You wrote #{cohort}, are you sure that's the cohort you want? Y/N"
  choice = gets.chomp
#Now the user select an option
  if choice.upcase == "Y"
    #If empty, returns the default cohort November
    if cohort.empty?
      return choosen_cohort[10]
      #If the number is selected correctly it will return the cohort
    elsif 0 < cohort.to_i && cohort.to_i < 13
      return choosen_cohort[cohort.to_i-1]
    else
      #If the input is not in the list we have the wrong input message
      puts "Wrong input, try again"
      input_cohort(choosen_cohort)
    end
  #if the user selects no, it goes back to the previous step
  elsif choice.upcase == "N"
    input_cohort(choosen_cohort)
  #if wrong input, it goes back to the previous step
  else
    puts "wrong input try again"
    input_cohort(choosen_cohort)
  end
end



#This method sort the array of students based on the cohort
def sort_cohort(choosen_cohort, names)
#We now print the header here
print_head

  #It take the arrays of the months that are already sorted
  choosen_cohort.map do |month|
    #this selector will tell us if it is the first name on the list, in that case it will print the "header"
    #of the list
    first = true
    #for each student if will compare the cohort and the month, if true it prints the student
      names.each do |student|
        if student[:cohort] == month && first == false
          puts "#{student[:name]}".center(80)
        elsif student[:cohort] == month && first == true
          first = false
          puts "The students of the #{month} cohort are:".center(80)
          puts "#{student[:name]}".center(80)
        end
      end

  end
end

#This method allows the user to choose which cohort is displayed
def cohort_display(choosen_cohort)
  puts "Do you want to select which cohort is displayed? Y/N".center(60)
  puts "If you don't, all of them will be displayed".center(60)
  option = gets.chomp
  #if yes, select a month
  if option.upcase == "Y"
    return [input_cohort(choosen_cohort)]
  #if no, return the sorted array
  elsif option.upcase == "N"
    return choosen_cohort
  #else, goes to the previous step
  else
    puts "Wrong argument, try again"
    cohort_display(choosen_cohort)
  end
end

def interactive_menu
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
    students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"

    selection = gets.chomp

    case selection
    when "1"
      students = input_students(choosen_cohort)
    when "2"
      sort_cohort(cohort_display(choosen_cohort), students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  end

end

interactive_menu
