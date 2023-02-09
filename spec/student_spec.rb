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

  #   describe '#to_json' do
  #     it 'returns a JSON representation of the Student object' do
  #       @student = Student.new('Jane Doe')
  #       @student.teachers = ['John Smith', 'Jane Smith']
  #       expect(@student.to_json).to eq({ 'name' => 'Jane Doe', 'teachers' => ['John Smith', 'Jane Smith'] })
  #     end
  #   end
end
