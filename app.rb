require_relative "app/models/student"
require_relative "app/models/paradise"

require_relative "app/repositories/student_repository"
require_relative "app/repositories/paradise_repository"

PARADISES_CSV_FILE = File.join(__dir__, "data/paradises.csv")
STUDENTS_CSV_FILE = File.join(__dir__, "data/students.csv")

# ###############################
# 🏖 Anti-cabin fever lecture 🌴
#   Build an app with 2 models
# ###############################

# 1. Create 2 Models with attributes in a hashes
# 2. Create 2 students and send them to a Paradise destination (in app.rb)

okinawa = Paradise.new(id: 1, name: "Okinawa 🤿", near_japan: true)

aki = Student.new(id: 1, name: "Aki🎂", cabin_fever_level: 10, paradise: okinawa)
farrah = Student.new(id: 1, name: "Farrah", cabin_fever_level: 99, paradise: okinawa)

puts "Aki's instance and destination instance: 🎉"
puts
p aki
p aki.paradise
puts
puts "Where are Aki and Farrah?"
puts
puts "#{aki.name} is in #{aki.paradise.name}."
puts "#{farrah.name} is in #{farrah.paradise.name}."
puts

# 3. Load Students and destinations from the CSVs
paradise_repository = ParadiseRepository.new(PARADISES_CSV_FILE)
student_repository = StudentRepository.new(STUDENTS_CSV_FILE, paradise_repository)

puts "All the loaded destinations: 🏖"
puts
paradise_repository.all.each { |paradise| p paradise }
puts
puts "All the loaded students: 🎓"
puts
student_repository.all.each { |student| p student }
puts
student_repository.all.each do |student|
  puts "#{student.name} is in #{student.paradise.name}."
end
