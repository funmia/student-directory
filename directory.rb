COHORT_LIST =[:january,:february,:march,:april,:may,:june,:july,:august,:september,:october,:november,:december]

@students = [] #an empty array accessible to all methods

def interactive_menu
  loop do
    # print the menu of options
    print_menu
    # read input and save to a variable
    selection = gets.chomp
    # do what the user has asked
    process(selection)
  end
end

def process(selection)
  case selection
    when "1"
     #input the students
     input_students()
    when "2"
      # show the students
      show_students()
    when "3"
      save_students()
    when "9"
      #this will cause the program to terminate
      exit
    else
      puts "I don't know what you meant, try again"
    end
end

def print_menu
 # print the menu and ask the user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit" # 9 because we'll be adding more items
end

def show_students
  print_header()
  print_students_list()
  print_footer()
end

def save_students
  #open the file for writing 
  file = File.open("students.csv", "w")
  # iterate over the array of students 
  @students.each do |student|
    student_data = [student[:name], student[:country], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end 
  file.close 
end 

# Aligns the text to the center
def center_align(text)
  width = 200
  puts text.center(width)
end

def print_header
  center_align("The students of Villians Academy")
  center_align( "-------------")
end

def show_students
  print_header()
  print_students_list()
  print_footer()
end

# Aligns the text to the center
def center_align(text)
  width = 200
  puts text.center(width)
end

def print_header
  center_align("The students of Villians Academy")
  center_align( "-------------")
end

def print_students_list
  if @students.empty?
    center_align("Please enter at least one student.")
    puts
  end
  @students = @students.sort_by {|student| COHORT_LIST.index(student[:cohort])}
  @students.each_with_index do |student, i|
    center_align("#{i + 1}. #{@students[i][:name]} #{@students[i][:country]} (cohort: #{@students[i][:cohort]})")
  end
end

def print_footer
  center_align("Overall, we have #{@students.count} great students")
  puts
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  puts "Enter a name"
  name = gets.delete("\n")

  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Enter student's country"
    country = gets.delete("\n")

    puts "Enter the student's cohort"
    cohort = gets.delete("\n").to_sym

    if cohort.empty?
      cohort= :not_decided
    end

    # add the student hash to the array
    @students << {name: name, country: country, cohort: cohort}

    if @students.size > 1
     puts "Now we have #{@students.count} students"
    else
      puts "Now we have #{@students.count} student"
    end
    # get another name from the user
    puts "Enter a name"
    name = gets.delete("\n")
  end
end

interactive_menu()


