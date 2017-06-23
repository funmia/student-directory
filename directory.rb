COHORT_LIST =[:january,:february,:march,:april,:may,:june,:july,:august,:september,:october,:november,:december]

def interactive_menu 
  students = []
  loop do 
    # print the menu and ask the user what to do 
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" 
    # read the input and save it in a vaiable 
    selection = gets.chomp 
    #do what the user has asked 
    case selection 
      when "1"
       #input the students 
       students = input_students()
      when "2"
        # show the students 
        print_header
        print(students)
        print_footer(students)
      when "9"
        break #exit #this will cause the program to terminate 
      else 
        puts "I don't know what you meant, try again"
      end 
  end
end  

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter a name"
  name = gets.delete("\n")
  
  # while the name is not empty, repeat this code 
  while !name.empty? do 
    puts "Enter student's country"
    country = gets.delete("\n")
  
    puts "Enter the student's course"
    course = gets.delete("\n")
    
    puts "Enter the student's cohort"
    cohort = gets.delete("\n").to_sym
    
    if cohort.empty? 
      cohort= :not_decided
    end 
    
    # add the student hash to the array
    students << {name: name, country: country, course: course, cohort: cohort}
    
    if students.size > 1 
     puts "Now we have #{students.count} students"
    else 
      puts "Now we have #{students.count} student"
    end
    
    # get another name from the user 
    puts "Enter a name"
    name = gets.delete("\n")
  end 
  # return the array of students 
  students
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

def print(students)
  if students.empty?
    center_align("Please enter at least one student.")
    puts
  end 
  students = students.sort_by {|student| COHORT_LIST.index(student[:cohort])}
  students.each_with_index do |student, i|
    center_align("#{i + 1}. #{students[i][:name]} #{students[i][:country]} #{students[i][:course]} (cohort: #{students[i][:cohort]})")
  end 
end 
 
def print_footer(students)
  center_align("Overall, we have #{students.count} great students")
  puts 
end 

interactive_menu()





