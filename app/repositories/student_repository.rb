require "csv"
require_relative "../models/student"

class StudentRepository
  def initialize(csv_file, paradise_repository)
    @csv_file = csv_file
    @paradise_repository = paradise_repository
    @students = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @students
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      # Be careful, we have to convert any attribute that is, not string
      row[:id] = row[:id].to_i
      row[:cabin_fever_level] = row[:cabin_fever_level].to_i
      row[:paradise] = @paradise_repository.find(row[:paradise_id].to_i)
      @students << Student.new(row)
    end
    @next_id = @students.last.id + 1 unless @students.empty?
  end
end
