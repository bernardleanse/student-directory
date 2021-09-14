student_list = [
  "Dr Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Micheal Corelone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates" 
]

# prints the header
def print_header
  puts "The students of Villains Accademy"
  puts "------------------------"
end

# gives every indivudal name given to each students string object in list
def print_each_name(name_list)
  name_list.each { |student| puts student}
end 

# Displaying the total number of students
def print_footer(list)
  puts "Overall we have #{list.length} students at the accademy"
end

# method calls

print_header()
print_each_name(student_list)
print_footer(student_list)

