#we have the students in an array
students = [
["Dr. Hannibal Lecter", :november],
["Darth Vader", :november],
["Nurse Ratched", :november],
["Michael Corleone", :november],
["Alex DeLarge", :november],
["The Wicked Witch of the West", :november],
["Terminator", :november],
["Freddy Krueger", :november],
["The Joker", :november],
["Joffrey Baratheon", :november],
["Norman Bates", :november],
["The one that putted HL and The Joker as villians, they are true heroes", :november]]
#We create a head-printer method

def print_head
  puts "The Students of The Villian Academy"
  puts "----------------------------"
end

#Now an students-printer method
def print_students(names)
  names.each do |name|
    puts "#{name[0]} (#{name[1]} cohort)"
  end
end

#Now the print the sum of the students method
def print_footer(names)
    puts "Overall, we have #{names.count} great students"
end

print_head
print_students(students)
print_footer(students)
