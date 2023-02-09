require 'spec_helper'

describe BaseDecorator do
  let(:decorator) { BaseDecorator.new(TestNameable.new) }

  describe '#initialize' do
    it 'returns a BaseDecorator object' do
      expect(decorator).to be_an_instance_of BaseDecorator
    end
  end

  describe '#correct_name' do
    it 'correct_name' do
      expect(decorator.correct_name).to eq('testnameable')
    end
  end
end

describe TrimmerDecorator do
  let(:decorator) { TrimmerDecorator.new(TestNameable.new) }

  describe '#correct_name' do
    it 'trimms the correct name' do
      expect(decorator.correct_name).to eq('testnameab')
    end
  end
end

describe CapitalizeDecorator do
  let(:decorator) { CapitalizeDecorator.new(TestNameable.new) }

  describe '#correct_name' do
    it 'capitalize the correct name' do
      expect(decorator.correct_name).to eq('Testnameable')
    end
  end
end

class TestNameable < Nameable
  def correct_name
    'testnameable'
  end
end
