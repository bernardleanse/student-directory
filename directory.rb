student_list = [
  {:name => "Dr Hannibal Lecter", :cohort => :september },
  {:name => "Darth Vader", :cohort => :september },
  {:name => "Nurse Ratched", :cohort => :september },
  {:name => "Micheal Corelone", :cohort => :september },
  {:name => "Alex DeLarge", :cohort => :september },
  {:name => "The Wicked Witch of the West", :cohort => :september },
  {:name => "Terminator", :cohort => :september },
  {:name => "Freddy Krueger", :cohort => :september},
  {:name => "The Joker", :cohort => :september },
  {:name => "Joffrey Baratheon", :cohort => :september },
  {:name => "Norman Bates", :cohort => :september } 
]

# prints the header
def print_header
  puts "The students of Villains Accademy"
  puts "------------------------"
end

# gives every indivudal name given to each students string object in list
def print_each_name(name_list)
  name_list.each { |student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end 

# Displaying the total number of students
def print_footer(list)
  puts "Overall we have #{list.length} students at the accademy"
end

# method calls

print_header()
print_each_name(student_list)
print_footer(student_list)





