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

puts "The students of Villains Accademy"
puts "------------------------"

student_list.each { |student | puts student} 

# Displaying the total number of students
puts "Overall we have #{student_list.length} students at the accademy"
