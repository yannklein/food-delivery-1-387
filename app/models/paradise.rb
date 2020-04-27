class Paradise
  attr_accessor :id
  attr_reader :name, :near_japan

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @near_japan = attributes[:near_japan]
  end
end
