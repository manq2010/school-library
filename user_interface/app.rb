require_relative '../components/book'
require_relative '../components/rental'
require_relative '../components/student'
require_relative '../components/teacher'
require_relative '../components/person'
require_relative '../user_interface/books_ui'
require_relative '../user_interface/person_ui'
require_relative '../user_interface/rental_ui'

class App
  attr_accessor :books, :people, :rentals

  def initialize
    @books = BookUserInterface.new
    @people = PersonUserInterface.new
    @rentals = RentalUserInterface.new(@books, @people)
  end

  def book_count
    puts "\"#{@books.books.size}\" books available!"
  end

  def people_count
    puts "\"#{@people.people.size}\" people in total!"
  end

  def rental_count
    puts "\"#{@rentals.rentals.size}\" rental(s) made!"
  end

  def handle_student_input
    @people.handle_student_input
  end

  def handle_teacher_input
    @people.handle_teacher_input
  end

  def list_all_people
    @people.list_all_people
  end

  def create_book
    @books.create_book
  end

  def list_all_books
    @books.list_all_books
  end

  def create_rental
    @rentals.create_rental
  end

  def list_rentals_for_person
    @rentals.list_rentals_for_person
  end
end
