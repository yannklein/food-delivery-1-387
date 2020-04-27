require "csv"
require_relative "../models/paradise"

class ParadiseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @paradises = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @paradises
  end

  def find(id)
    @paradises.find do |paradise|
      paradise.id == id
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
    # Be careful, we have to convert any attribute that is, not string
      row[:id] = row[:id].to_i
      row[:near_japan] = row[:near_japan] == "true"
      @paradises << Paradise.new(row)
    end
    @next_id = @paradises.last.id + 1 unless @paradises.empty?
  end
end
