require 'spec_helper'

describe Person do
  describe '#initialize' do
    before :each do
      @person = Person.new(20, 'Mancoba')
    end

    it 'returns a Person object' do
      expect(@person).to be_an_instance_of Person
    end

    it 'creates a new Person object with default values' do
      expect(@person.parent_permission).to eq(true)
      expect(@person.person_type).to eq('student')
      expect(@person.rentals).to eq([])
    end

    it { expect(@person).to have_attributes(age: 20) }
    it { expect(@person).to have_attributes(name: 'Mancoba') }
  end
end
