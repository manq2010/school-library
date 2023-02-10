require 'spec_helper'

describe Student do
  describe '#initialize' do
    before :each do
      @student = Student.new(17, 'Young Tiger', parent_permission: true)
    end

    it 'returns a Student object' do
      expect(@student).to be_an_instance_of Student
    end

    it 'inherits the name attribute from Person' do
      expect(@student).to have_attributes(age: 17)
      expect(@student).to have_attributes(name: 'Young Tiger')
      expect(@student).to have_attributes(parent_permission: true)
    end

    it 'has an empty list of teachers by default' do
      expect(@student.rentals).to eq([])
    end
  end

  describe '#classroom=' do
    before :each do
      @student = Student.new(17, 'Young Tiger', parent_permission: true)
      @classroom = Classroom.new('Class 1')
    end

    it 'sets the classroom of the student to the given classroom' do
      @student.classroom = @classroom
      expect(@student.classroom).to eq(@classroom)
    end

    it 'adds the student to the students of the given classroom' do
      @student.classroom = @classroom
      expect(@classroom.students).to include(@student)
    end
  end

  describe '#play_hooky' do
    before :each do
      @student = Student.new(17, 'Young Tiger', parent_permission: true)
    end

    it 'returns a shrugging emoticon' do
      expect(@student.play_hooky).to eq('¯\(ツ)/¯')
    end
  end

  describe '#to_json' do
    before :each do
      @student = Student.new(17, 'Young Tiger', parent_permission: true)
    end

    it 'returns a hash of the student\'s attributes' do
      expected_output = { 'id' => @student.id, 'name' => 'Young Tiger', 'age' => 17, 'parent_permission' => true,
                          'class' => 'Student' }
      expect(@student.to_json).to eq(expected_output)
    end
  end
end
