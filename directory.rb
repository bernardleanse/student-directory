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

@students = []

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

def print_students
  name_list = creates_ordered_list(@students)
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

def print_beginning_with_letter(letter)
  unless letter.instance_of? String  
    return "Error: must recieve single letter string" 
  end

  filtered = @students.select { |student| student[:name][0].downcase == letter }
  return print_students(filtered)

end

def print_less_than_n_chars(n)
  filtered = @students.select { |student| student[:name].length < n }
  return print_students(filtered)
end

# Displaying the total number of students
def print_footer
  puts "Overall we have #{@students.length} students at the accademy".center(100)
end


def add_students
  
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

    @students << {name: student_name, cohort: student_cohort.to_sym }
    puts "We currently have #{@students.length} student" if @students.length == 1
    puts "We currently have #{@students.length} students" unless @students.length == 1
    puts "Enter stop when you've finished"
    
  end

end

def append_student_list(list)
  @students.push(add_students()).flatten!
end

def print_menu
  puts "Select and option: "
  puts "1. Input Students"
  puts "2. List all Students"
  puts "3. Save all Students to csv"
  puts "9. Exit"
end

def show_students
  print_header()
  print_students()
  print_footer()
end

def process(user_selection)
  case user_selection
  when "1"
    add_students
  when "2"
    show_students
  when "3"
    save_to_file
  when "9"
    exit
  else
    "Error, Try Again."
  end
end

def interactive_menu

  loop do
  
    print_menu()
    user_selection = gets.chomp
    process(user_selection) 

  end

end

def save_to_file
  file = File.open('students.csv', 'w')

  @students.each do |student|
    data = [student[:name], student[:cohort]]
    csv_line = data.join(", ")
    file.puts csv_line
  end

  file.close


end

# method calls

interactive_menu()

# student_list = create_student_list
# print_header()
# print_each_name(student_list)
# print_footer(student_list)






