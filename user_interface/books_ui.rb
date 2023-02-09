require 'json'
require 'fileutils'
require_relative '../components/book'

class BookUserInterface
  FILE_LOCATION = './data/books.json'.freeze
  attr_accessor :books

  def initialize
    @books = load_books
  end

  def load_books
    if File.directory?('data') && File.file?(FILE_LOCATION)
      file = File.new(FILE_LOCATION, 'r')

      if file.size.zero?
        []
      else
        JSON.parse(File.read(FILE_LOCATION))
      end
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
    File.write(FILE_LOCATION, JSON.pretty_generate(@books))
  end

  def create_book
    title = handle_title_input
    author = handle_author_input
    @books << Book.new(title, author).to_json
    save
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
    puts ['No books found on the list', ''] if @books.empty?

    @books.each do |book|
      puts "Title: #{book['title']}, Author: #{book['author']}"
    end
  end
end
