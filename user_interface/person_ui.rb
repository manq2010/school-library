require 'json'
require 'fileutils'
require_relative '../components/student'
require_relative '../components/teacher'
require_relative '../components/person'

class PersonUserInterface
  FILE_LOCATION = './data/people.json'.freeze

  attr_accessor :people

  def initialize
    @people = load
  end

  def load
    if File.directory?('data') && File.file?(FILE_LOCATION)
      File.nil? ? JSON.parse(File.read(FILE_LOCATION)) : []
    elsif File.directory?('data') && !File.exist?(FILE_LOCATION)
      FileUtils.touch(FILE_LOCATION)
      []
    else
      FileUtils.mkdir_p(['data'])
      FileUtils.touch(FILE_LOCATION)
      []
    end
  end

  def save
    File.write(FILE_LOCATION, JSON.pretty_generate(@people))
  end

  def save_empty_array
    File.write(FILE_LOCATION, JSON.pretty_generate([]))
  end

  def handle_student_input
    age = handle_age_input
    name = handle_name_input
    parent_permission = handle_permission
    student = Student.new(age, name, parent_permission: parent_permission, person_type: 'student')
    @people << student.to_json
    save
    puts ['Person created succsefully', ' ']
  end

  def handle_teacher_input
    age = handle_age_input
    name = handle_name_input
    specialization = handle_specialization
    teacher = Teacher.new(age, name, specialization, person_type: 'teacher')
    @people << teacher.to_json
    save
    puts ['Person created succsefully', ' ']
  end

  def handle_age_input
    print 'Age: '
    validate_integer
  end

  def handle_name_input
    print 'Name: '
    gets.chomp.capitalize
  end

  def handle_permission
    print 'Has Parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize

    case parent_permission
    when 'Y'
      true
    when 'N'
      false
    else
      puts 'Invalid selection, please choose from Y or N'
      handle_permission
    end
  end

  def handle_specialization
    print 'Specialization: '
    gets.chomp.capitalize
  end

  def validate_integer
    input = gets.chomp
    if input =~ /\A\d{1,2}\z/ && input.to_i < 100
      input.to_i
    else
      print 'Invalid input. Please enter a non-negative integer less than 100: '
      validate_integer
    end
  end

  def list_all_people
    @people.each do |person|
      puts "[#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end

    puts ['No person on the list', ''] if @people.empty?
  end
end
