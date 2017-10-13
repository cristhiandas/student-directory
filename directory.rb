@students = []
@choosen_cohort = [:January,
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
  :December,
  :NotSpecified
  ]
@margins = 80
#We create a head-printer method
def print_head
  if @student =! nil
    puts "The Students of The Villian Academy".center(@margins)
    puts "----------------------------".center(@margins)
  else
    puts "There are no students in the Villian Academy"
  end
end

#Now the print the sum of the students method
def print_footer
  if @students.count ==1
    puts "Overall, we have #{@students.count} great student \n".center(@margins)
  else
    puts "Overall, we have #{@students.count} great students \n".center(@margins)
  end
end


def input_students
  #first we ask for the names
  puts "Please dear user, write the name of a student and press return"
  puts "if you want to go back to the menu, press return"
  #We get the first name
  name = gets.chomp.capitalize

  #if no names, it'll return nill
  return nil if name.empty?

  #We need to repeat the code while the name isn't empty
  while !name.empty? do

    @students << {name: name, cohort: input_cohort}

    if @students.count != 1
      puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end

    #and we ask for names again
    puts "Now you can add another name or press return to go back to the menu"
    name = gets.chomp.capitalize

  end
  #return the array of students
  @students

end

#This directory will display the students names with the specified letters
def sort_by_letter
  #This counter is used to now how many students begins with the letters
  students_count = 0
  puts "Please, type the student's name or initial you want to find".center(@margins)
  letters = gets.chomp.capitalize
  if letters.nil?
    puts "   It seems you didn't provide any letters to search by".center(@margins)
  else
    #we print the head inside the method, this way it will print it after the previous puts
    #and not before them
    print_head
    puts "These are the students with the letters you asked for".center(@margins)
    #An iteration to print each student that begins with the letters
    @students.each do |student|
      if student[:name].start_with?(letters)
        puts "#{student[:name]} #{student[:cohort]} cohort".center(@margins)
        #Add one to the counter
        students_count += 1
      end
    end
    #Print the number of students whose names begins with the specified letters
    puts "There is #{students_count} student whose name begins with #{letters}".center(@margins) if students_count == 1
    puts "There are #{students_count} students whoses names begins with #{letters}".center(@margins) if students_count != 1
  end
end
#This method will ask for a cohort to select, if empty will select november by default, if it have a typo
#It will show a wrong input message


def input_cohort
  puts "Choose the cohort, please write ONLY the number of the cohort you want".center(@margins)
  puts "1 January       2 February        3 March         4 April            5 May         6 June".center(@margins)
  puts "7 July          8 August        9 September      10 October      11 November   12 December".center(@margins)
#We get the number of the cohort
  cohort = gets.chomp
  puts "You wrote #{cohort}, are you sure that's the cohort you want? Y/N"
  choice = gets.chomp
#Now the user select an option
  if choice.upcase == "Y"
    #If empty, returns the default cohort November
    if cohort.empty?
      return :NotSpecified
      #If the number is selected correctly it will return the cohort
    elsif 0 < cohort.to_i && cohort.to_i < 13
      return @choosen_cohort[cohort.to_i-1]
    else
      #If the input is not in the list we have the wrong input message
      puts "Wrong input, try again"
      input_cohort
    end
  #if the user selects no, it goes back to the previous step
  elsif choice.upcase == "N"
    input_cohort
  #if wrong input, it goes back to the previous step
  else
    puts "wrong input try again"
    input_cohort
  end
end



#This method sort the array of students based on the cohort
def sort_cohort(cohort_display)
#We now print the header here
print_head

  #It take the arrays of the months that are already sorted
  cohort_display.map do |month|
    #this selector will tell us if it is the first name on the list, in that case it will print the "header"
    #of the list
    first = true
    students_of_the_cohort = 0
    #for each student if will compare the cohort and the month, if true it prints the student
      @students.each do |student|
        if student[:cohort] == month && first == false
          puts "#{student[:name]}".center(@margins)
          students_of_the_cohort += 1
        elsif student[:cohort] == month && first == true
          first = false
          puts "The students of the #{month} cohort are:".center(@margins)
          puts "#{student[:name]}".center(@margins)
          students_of_the_cohort += 1
        end
      end
      puts "there are #{students_of_the_cohort} students, in this cohort".center(@margins) if students_of_the_cohort > 1
      puts "there is #{students_of_the_cohort} student, in this cohort".center(@margins) if students_of_the_cohort == 1
  end
end

#This method allows the user to choose which cohort is displayed
def cohort_display
  puts "Do you want to select which cohort is displayed? Y/N".center(@margins)
  puts "If you don't, all of them will be displayed".center(@margins)
  option = gets.chomp
  #if yes, select a month
  if option.upcase == "Y"
    return [input_cohort]
  #if no, return the sorted array
  elsif option.upcase == "N"
    return @choosen_cohort
  #else, goes to the previous step
  else
    puts "Wrong argument, try again"
    cohort_display
  end
end

#This method prints the students
def show_students
  sort_cohort(cohort_display)
  print_footer
end

def show_students_by_letters
  sort_by_letter
  print_footer
end
#This method save the students names and cohorts in a file
def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  #closing the file
  file.close
  puts "Yor students have been saved (You are a hero)"
end

#Method that prints the main menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Search for specific students"
  puts "4. Save the students in a file"
  puts "5. loads the students in the file"
  puts "9. Exit"
end

#This is the selection method, here we find our options
def process(selection)
  case selection
    #if selected 1 you can input the students names and cohorts
    when "1"
      input_students
    #if selected 2 prints the list of the students
    when "2"
      show_students
    #if selected 3 prints the search for an specific student
    when "3"
      show_students_by_letters
    #if selected 4 save all the students in a file
    when "4"
      save_students
    #if 5 load the students that are already in the file
    when "5"
      load_students
    #if selected 9 exits the program
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
  puts "You've loaded the file, awesome man!"
end

def interactive_menu

  loop do
    print_menu
    process(gets.chomp)
  end

end

interactive_menu
