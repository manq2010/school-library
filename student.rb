require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission)
    # @classroom = classroom
    belongs_to(classroom)
  end

  def belongs_to(classroom)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
