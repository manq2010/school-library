require 'json'
require 'fileutils'
require_relative '../components/book'
require_relative '../components/person'

class RentalUserInterface
  FILE_LOCATION = './data/rentals.json'.freeze

  attr_accessor :rentals

  def initialize(books, people)
    @rentals = load
    @books = books
    @people = people
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
    File.write(FILE_LOCATION, JSON.pretty_generate(@rentals))
  end

  def create_rental
    puts 'Select a book from the following list by number'
    book_array = @books.books
    book_array.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book['title']}\", Author: #{book['author']}"
    end
    book_number = handle_book_number
    book = book_array[book_number]

    puts ['', 'Select a person from the following list by number (not id']
    people_array = @people.people
    people_array.each_with_index do |person, index|
      puts "#{index}) [#{person['class']}] Name: #{person['name']}, ID: #{person['id']}, Age: #{person['age']}"
    end
    person_number = handle_person_number
    person = people_array[person_number]
    puts ''

    date = handle_date_input

    @rentals << Rental.new(date, book, person).to_json
    save
    puts 'Rental created successfully'
  end

  def handle_book_number
    value = gets.chomp

    if (value.to_i < @books.books.size && value.to_i > -1) && value.match?(/\A[+-]?\d+\z/)
      value.to_i
    elsif @books.books.size == 1 && value.match?(/\A[+-]?\d+\z/)
      puts 'Please enter 0'
      handle_book_number
    else
      puts "Please enter a number from 0 to #{@books.books.size - 1}"
      handle_book_number
    end
  end

  def handle_person_number
    value = gets.chomp

    if (value.to_i < @people.people.size && value.to_i > -1) && value.match?(/\A[+-]?\d+\z/)
      value.to_i
    elsif @people.people.size == 1 && value.match?(/\A[+-]?\d+\z/)
      puts 'Please enter 0'
      handle_book_number
    else
      puts "Please enter a number from 0 to #{@people.people.size - 1}"
      handle_person_number
    end
  end

  def handle_date_input
    print 'Date: '
    date = gets.chomp

    date_regex = /\A\d{4}-\d{2}-\d{2}\z/
    if date_regex.match?(date)
      date
    else
      puts 'Invalid date format. Please enter the date in YYYY-MM-DD format.'
      handle_date_input
    end
  end

  def list_rentals_for_person
    person_id = handle_person_input
    people_array = @people.people
    person = people_array.find { |p| p['id'] == person_id }
    if person.nil?
      puts "No person found with id #{person_id}"
      return
    end

    puts 'Rentals: '

    rentals = @rentals.select { |r| r['id'] == person_id }

    if rentals.empty?
      puts "No rentals found for person with id #{person_id}"
      return
    end

    rentals.each do |rental|
      puts "Date: #{rental['date']}, Book \"#{rental['title']}\" by #{rental['name']}"
    end
  end

  def handle_person_input
    print 'ID of person: '
    gets.chomp.to_i
  end
end
