class App
  puts ['Welcome to School Library App!', ' ']

  loop do
    puts 'Please choose an option by entering a number:'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List rentals for a given person id'
    puts '7 - Exit'

    input = gets.to_i

    case input
    when 1
    when 2
    when 3
      loop do
        print 'Do you want to create a student (1) or a teacher (2)? '
        print '[Input the number]: '
        choice = gets.to_i

        case choice
        when 1
          print 'Age: '
          age = gets.chomp
          print 'Name: '
          name = gets.chomp
          print 'Has Parent permission? [Y/N]: '
          permission = gets.chomp
          puts ['Person created succsefully', ' ']
          break
        when 2
          print 'Age: '
          age = gets.chomp
          print 'Name: '
          name = gets.chomp
          print 'Specialization: '
          specialization = gets.chomp
          puts ['Person created succsefully', ' ']
          break
        end
      end
    when 4
        print "Title: "
        title = gets.chomp
        print "Author: "
        author = gets.chomp
        puts ['Book created succsefully', ' ']
    when 5
    when 6
    when 7
      break
    end
  end
end
