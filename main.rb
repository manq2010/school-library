require './app'

class Main
  def initialize
    @app = App.new
    # @input = nil
  end

  def display_options
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List rentals for a given person id'
    puts '7 - Exit'
  end

  def process_input(input)
    case input
    when 1
      @app.list_all_books
    when 2
      @app.list_all_people
    when 3
      handle_create_person_display_text
      process_person_choice
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.list_rentals_for_person
    end
  end

  private

  def handle_create_person_display_text
    print 'Do you want to create a student (1) or a teacher (2)? '
    print '[Input the number]: '
  end

  def process_person_choice
    choice = gets.to_i
    case choice
    when 1
      @app.handle_student_input
    when 2
      @app.handle_teacher_input
    else
      puts 'Invalid choice, please select a number from [1..2]'
      process_person_choice
    end
  end
end

def main
  main = Main.new
  puts ['Welcome to School Library App!', '']
  input = nil
  until input == 7
    main.display_options
    input = gets.to_i
    puts 'Invalid choice, please select a number from [1..7]' if input < 1 || input > 7
    main.process_input(input)
  end
end

main