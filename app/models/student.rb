class Student
  attr_accessor :id
  attr_reader :name, :cabin_fever_level, :paradise

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @cabin_fever_level = attributes[:cabin_fever_level]
    @paradise = attributes[:paradise]
  end
end
