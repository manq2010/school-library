require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', parent_permission: true, person_type: 'student')
    super(age, name, parent_permission: parent_permission, person_type: person_type)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
