require 'rspec'

describe Teacher do
  let(:teacher) { Teacher.new(30, 'Mary Peter', 'English') }

  describe '#initialize' do
    it 'creates a new Teacher object' do
      expect(teacher).to be_an_instance_of Teacher
    end

    it 'sets the age, name, specialization, and parent_permission attributes' do
      expect(teacher).to have_attributes(age: 30)
      expect(teacher).to have_attributes(name: 'Mary Peter')
      expect(teacher).to have_attributes(specialization: 'English')
      expect(teacher).to have_attributes(parent_permission: true)
    end

    it 'inherits the parent_permission attribute from Person' do
      expect(teacher).to have_attributes(parent_permission: true)
    end
  end

  describe '#can_use_services?' do
    it 'returns true' do
      expect(teacher.can_use_services?).to be true
    end
  end

  describe '#to_json' do
    it 'returns a hash representation of the Teacher object' do
      expect(teacher.to_json).to eq(
        { 'id' => teacher.id,
          'name' => 'Mary Peter',
          'age' => 30,
          'specialization' => 'English',
          'class' => 'Teacher',
          'rentals' => teacher.rentals }
      )
    end
  end
end
