require 'rspec'

describe Classroom do
  let(:classroom) { Classroom.new('Class 1') }
  let(:student) { double('Student') }

  it 'has a label' do
    expect(classroom.label).to eq('Class 1')
  end

  it 'starts with no students' do
    expect(classroom.students).to be_empty
  end

  it 'adds a student' do
    allow(student).to receive(:classroom=).with(classroom)
    classroom.add_student(student)
    expect(classroom.students).to include(student)
  end
end
