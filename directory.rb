def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name 
  name = gets.chomp 
  # while the name is not empty, repeat this code 
  while !name.empty? do 
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count}"
    # get another name from the user 
    name = gets.chomp 
  end 
  # return the array of students 
  students 
end 

def print_header 
  puts "The students of Villians Academy"
  puts "-------------"
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


def print(students)
 i = 0 
  until i >= students.length
   puts "#{i + 1}. #{students[i][:name]} (#{students[i][:cohort]} cohort)"
  i += 1 
  end  
end 

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end 

students = input_students
students = sort_students(students)
#nothing happens until we call the methods

print_header
print(students)
print_footer(students)
