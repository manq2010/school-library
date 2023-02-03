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
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has Parent permission? [Y/N]: '
    parent_permission = gets.chomp.capitalize
    # student = Student.new(age, name, parent_permission: parent_permission)
    # @people << student
    # puts ['Student created succsefully', ' ']
    create_person(1, name, age, parent_permission)
  end

  def handle_teacher_input
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    # @person.push(Teacher.new(name, age, specialization))
    # puts ['Teacher created succsefully', ' ']
    create_person(2, name, age, specialization)
  end

  def create_person(choice, name, age, parent_permission = nil, specialization = nil)
    case choice
    when 1
      person = Student.new(name, age, parent_permission: parent_permission)
    when 2
      person = Teacher.new(name, age, specialization)
    end
    @people << person
    puts ['Person created successfully', '']
  end

  def list_all_people
    @people.each do |person|
      puts "Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
  end

  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully'
  end

  def list_all_books
    @books.each do |book|
      puts "Title: #{book.title}, Author: #{book.author}"
    end
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_number = gets.chomp.to_i
    book = @books[book_number]

    puts ['', 'Select a person from the following list by number (not id']
    @people.each_with_index do |person, index|
      puts "#{index}) Name: #{person.name}, ID: #{person.id} Age: #{person.age}"
    end
    person_number = gets.chomp.to_i
    person = @people[person_number]
    puts ''

    print 'Date: '
    date = gets.chomp

    @rentals << Rental.new(date, book, person)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person
    print 'ID of person: '
    person_id = gets.chomp.to_i

    rentals_for_person = @rentals.select { |rental| rental.person.id == person_id }

    puts rentals_for_person.to_s
    # if rentals_for_person.empty?
    #   puts 'No rentals found for this person.'
    # else
    #   rentals_for_person.each do |rental|
    #     puts "Book: #{rental.book.title}"
    #   end
    # end
  end
end
