require 'csv'

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
#this method will ask for the filename
def ask_for_file
  puts "Hi user, please insert a filename or press return to use default settings"
  puts "Don't forget to put the .txt, .csv, etc on you filename"
  filename = STDIN.gets.chomp
#returns the default file if no name is given
  return "students.csv" if filename.empty?

  filename
end
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

# a method that add the students to the list
def add_student(name, cohort)
    @students << {name: name, cohort: cohort}
    if @students.count != 1
      puts "Now we have #{@students.count} students on the list"
    else
      puts "Now we have #{@students.count} student on the list"
    end
end

def load_students(filename)

  CSV.foreach(filename) do |line|
      name = line[0]
      cohort = line[1]
      add_student(name, cohort.to_sym)
  end
  puts "You've loaded the file, awesome man!"
end

def input_students
  #first we ask for the names
  puts "Please dear user, write the name of a student and press return"
  puts "if you want to go back to the menu, press return"
  #We get the first name
  name = STDIN.gets.chomp.capitalize

  #if no names, it'll return nill
  return nil if name.empty?

  #We need to repeat the code while the name isn't empty
  while !name.empty? do
    cohort = input_cohort
    add_student(name.capitalize, cohort.to_sym)
    #and we ask for names again
    puts "Now you can add another name or press return to go back to the menu"
    name = STDIN.gets.chomp.capitalize

  end
  #return the array of students
  @students

end

#This directory will display the students names with the specified letters
def sort_by_letter
  #This counter is used to now how many students begins with the letters
  students_count = 0
  puts "Please, type the student's name or initial you want to find".center(@margins)
  letters = STDIN.gets.chomp.capitalize
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
  cohort = STDIN.gets.chomp
  puts "You wrote #{cohort}, are you sure that's the cohort you want? Y/N"
  choice = STDIN.gets.chomp
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
  option = STDIN.gets.chomp
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

  CSV.open(ask_for_file,"w") do |csv_file|
    @students.each do |student|
      csv_file << student
    end
  end

  puts "Yor students have been saved (You are a hero)"
end

#Method that prints the main menu
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Search for specific students"
  puts "4. Save the students in a file"
  puts "5. loads the students in the file"
  puts "6. Print the program sourcecode"
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
    when "6"
      quince
    #if selected 9 exits the program
    when "9"
      puts "Bye"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end


def try_load_students

  filename = ARGV.first # first argument from the command line
  if filename.nil?
    filename = ask_for_file
  end
  if File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

#This is actually not a quince or that's what I think because it reads the source code,
#but I liked the name
def quince
  $><<open($0).read
end

def interactive_menu
try_load_students
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end


interactive_menu
