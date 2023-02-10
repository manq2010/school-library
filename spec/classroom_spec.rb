require 'rspec'

describe Classroom do
  let(:classroom) { Classroom.new('Class 1') }
  let(:student) { Student.new(17, 'Young Tiger', parent_permission: true) }

  it 'has a label' do
    expect(classroom.label).to eq('Class 1')
  end

  describe '#students' do
    it 'starts with no students' do
      expect(classroom.students).to be_empty
    end

    it 'adds a student' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end
  end

  describe '#add_student' do
    it 'adds the student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'sets the classroom of the student' do
      classroom.add_student(student)
      expect(student.classroom).to eq(classroom)
    end
  end
end
