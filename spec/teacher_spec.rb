require 'spec_helper'

describe Teacher do
  describe '#initialize' do
    before :each do
      @teacher = Teacher.new(45, 'Mary Peter', 'Maths')
    end

    it 'returns a Teacher object' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'inherits the name attribute from Person' do
      expect(@teacher).to have_attributes(age: 45)
      expect(@teacher).to have_attributes(name: 'Mary Peter')
      expect(@teacher).to have_attributes(specialization: 'Maths')
    end

    it 'has an empty list of rentals by default' do
      expect(@teacher.rentals).to eq([])
    end
  end

  #   describe '#to_json' do
  #     it 'returns a JSON representation of the Teacher object' do
  #       @person = Teacher.new(45, 'Jimmy Holder', 'Bio')
  #       expect(@person.to_json).to eq({ 'age' => 45, 'name' => 'Jimmy Holder', 'class' => 'Teacher', 'rentals' => [],
  #                                         'specialization' => 'Bio' })
  #     end
  #   end
end
