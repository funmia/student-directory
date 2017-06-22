def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  puts "Enter a name"
  name = gets.chomp 
  
  # while the name is not empty, repeat this code 
  while !name.empty? do 
    puts "Enter student's country"
    country = gets.chomp 
  
    puts "Enter the student's course"
    course = gets.chomp 
    
    puts "Enter the student's cohort"
    cohort = gets.chomp.to_sym
    
    if cohort.empty? 
      cohort= :not_decided
    end 
    
    # add the student hash to the array
    students << {name: name, country: country, course: course, cohort: cohort}
    puts "Now we have #{students.count}"
    
    # get another name from the user 
    puts "Enter a name"
    name = gets.chomp 
  end 
  # return the array of students 
  students 
end 

def sort_students(students)
  sorted_students = []
  students.each do |student|
    first_letter = student[:name][0].downcase
    if first_letter == "c" && student[:name].length < 12
      sorted_students << student
    end
  end
  return sorted_students
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
 i = 0 
  until i >= students.length
   center_align("#{i + 1}. #{students[i][:name]} #{students[i][:country]} #{students[i][:course]} (cohort: #{students[i][:cohort]})")
  i += 1 
  end  
end 

def print_footer(students)
  center_align("Overall, we have #{students.count} great students")
end 

students = input_students
#students = sort_students(students)  if you want print out the sorted list.
#nothing happens until we call the methods

print_header()
print(students)
print_footer(students)

