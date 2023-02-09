require_relative 'person'

class Teacher < Person
  def initialize(age, name, specialization, parent_permission: true, person_type: 'teacher')
    super(age, name, parent_permission: parent_permission, person_type: person_type)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*_args)
    { 'id' => @id, 'name' => @name, 'age' => @age, 'specialization' => @specialization, 'class' => self.class.name,
      'rentals' => @rentals }
  end
end
