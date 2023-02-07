require_relative 'book'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'
require_relative 'person'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def handle_student_input
    age = handle_age_input
    name = handle_name_input
    parent_permission = handle_permission
    student = Student.new(age, name, parent_permission: parent_permission, person_type: 'student')
    @people << student
    puts @people
    puts ['Person created succsefully', ' ']
  end

  def handle_teacher_input
    age = handle_age_input
    name = handle_name_input
    specialization = handle_specialization
    teacher = Teacher.new(age, name, specialization, person_type: 'teacher')
    @people << teacher
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
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    puts ['No person on the list', ''] if @people.empty?
  end

  def create_book
    title = handle_title_input
    author = handle_author_input
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def handle_title_input
    print 'Title: '
    gets.chomp.capitalize
  end

  def handle_author_input
    print 'Author: '
    gets.chomp.capitalize
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end

    puts ['No books found on the list', ''] if @books.empty?
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_number = handle_book_number
    book = @books[book_number]

    puts ['', 'Select a person from the following list by number (not id']
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_number = handle_person_number
    person = @people[person_number]
    puts ''

    date = handle_date_input

    @rentals << Rental.new(date, book, person)
    puts 'Rental created successfully'
  end

  def handle_book_number
    gets.chomp.to_i
  end

  def handle_person_number
    gets.chomp.to_i
  end

  def handle_date_input
    print 'Date: '
    gets.chomp
  end

  def list_rentals_for_person
    person_id = handle_person_input

    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts "No person found with id #{person_id}"
      return
    end

    puts 'Rentals: '

    rentals = @rentals.select { |r| r.person.id == person_id }
    if rentals.empty?
      puts "No rentals found for person with id #{person_id}"
      return
    end

    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.person.name}"
    end
  end

  def handle_person_input
    print 'ID of person: '
    gets.chomp.to_i
  end
end
