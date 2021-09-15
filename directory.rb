student_list = [
  {:name => "Dr Hannibal Lecter", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Darth Vader", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Nurse Ratched", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Micheal Corelone", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Alex DeLarge", :cohort => :november, height: "170cm", birth_country: "" },
  {:name => "The Wicked Witch of the West", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Terminator", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Freddy Krueger", :cohort => :october, height: "170cm", birth_country: ""},
  {:name => "The Joker", :cohort => :september, height: "170cm", birth_country: "" },
  {:name => "Joffrey Baratheon", :cohort => :october, height: "170cm", birth_country: "" },
  {:name => "Norman Bates", :cohort => :september, height: "170cm", birth_country: "" } 
]

class String
  def is_valid_cohort?
    months = "january february march april may june july august september october november december".split
    return true if months.include? self
    return false
  end
end

class Array
  def order_by_month
    months = "january february march april may june july august september october november december".split
    months.map! { |month| month.to_sym }
    return months.select{ |month| self.include? month }
  end
end


# prints the header
def print_header
  puts "The students of Villains Accademy".center(100)
  puts "------------------------".center(100)
end

# gives every indivudal name given to each students string object in list
# def print_each_name(name_list)
#   name_list.each.with_index { |student, i| puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"}
# end 

def creates_ordered_list(list)
  ordered_list = []
  cohorts = list.map { |student| student[:cohort] }.uniq
  cohorts = cohorts.order_by_month
  cohorts.each do |month|
    list.each { |student| ordered_list << student if student[:cohort] == month }
  end
  return ordered_list
end

def print_each_name(name_list)
  name_list = creates_ordered_list(name_list)
  n = 0
   
  while true
    student = name_list[n]
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(100)
    n += 1

    # final student index will be list.length - 1.
    # the loop then adds 1 making n now equal to length. time to end loop.

    break if n == name_list.length 
  end
end

def print_beginning_with_letter(letter, name_list)
  unless letter.instance_of? String  
    return "Error: must recieve single letter string" 
  end

  filtered = name_list.select { |student| student[:name][0].downcase == letter }
  return print_each_name(filtered)

end

def print_less_than_n_chars(n, name_list)
  filtered = name_list.select { |student| student[:name].length < n }
  return print_each_name(filtered)
end

# Displaying the total number of students
def print_footer(list)
  puts "Overall we have #{list.length} students at the accademy".center(100)
end


def create_student_list
  students = Array.new
  
  while true
    puts "Enter student name"
    student_name = gets.chomp
    break if student_name == 'stop'

    student_cohort = String.new

    until student_cohort.is_valid_cohort?
      puts "Enter student cohort"
      student_cohort = gets.chomp
      puts "Invalid" unless student_cohort.is_valid_cohort?
    end

    student_cohort = "september" if student_cohort.empty?

    students << {name: student_name, cohort: student_cohort.to_sym }
    puts "We currently have #{students.length} student" if students.length == 1
    puts "We currently have #{students.length} students" unless students.length == 1
    puts "Enter stop when you've finished"
    
  end
  return students

end

def append_student_list(list)
  list.push(create_student_list).flatten!
end

def interactive_menu
  student_list = Array.new

  loop do
  puts "Select and option: "
  puts "1. Input Students"
  puts "2. List all Students"
  puts "9. Exit"
    
    user_selection = gets.chomp


    case user_selection
    when "1"
      student_list = create_student_list
    when "2"
      print_header()
      print_each_name(student_list)
      print_footer(student_list)
    when "9"
      break
    else
      "Error, Try Again."
    end

  end

end

# method calls

interactive_menu()

# student_list = create_student_list
# print_header()
# print_each_name(student_list)
# print_footer(student_list)






