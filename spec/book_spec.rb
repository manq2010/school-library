require 'spec_helper'

describe Book do
  describe '#initialize' do
    before :each do
      @book = Book.new('The Great Gatsby', 'F. Scott Fitzgerald')
    end

    it 'returns a Book object' do
      expect(@book).to be_an_instance_of Book
    end

    it 'creates a new Book object with empty rental array' do
      expect(@book.rentals).to eq([])
    end

    it { expect(@book).to have_attributes(title: 'The Great Gatsby') }
    it { expect(@book).to have_attributes(author: 'F. Scott Fitzgerald') }
  end

  describe '#to_json' do
    it 'returns a JSON representation of the Book object' do
      @book = Book.new('To Kill a Mockingbird', 'Harper Lee')
      expect(@book.to_json).to eq({ 'title' => 'To Kill a Mockingbird', 'author' => 'Harper Lee', 'rentals' => [] })
    end
  end
end

describe BookUserInterface do
  let(:file_location) { './data/books.json' }
  let(:file) { double('file') }

  before do
    allow(File).to receive(:directory?).and_return(true)
    allow(File).to receive(:file?).and_return(true)
    allow(File).to receive(:exist?).and_return(true)
    allow(File).to receive(:read).and_return('[]')
    allow(File).to receive(:write)
    allow(FileUtils).to receive(:touch)
    allow(FileUtils).to receive(:mkdir_p)
  end

  describe '#initialize' do
    it 'loads an existing list of books from a file' do
      book_ui = BookUserInterface.new
      expect(book_ui.books).to eq([])
    end

    it 'creates a file if it does not exist' do
      allow(File).to receive(:directory?).and_return(true)
      allow(File).to receive(:file?).and_return(false)
      allow(File).to receive(:exist?).and_return(false)
      book_ui = BookUserInterface.new
      expect(book_ui.books).to eq([])
    end

    it 'creates a directory and file if they do not exist' do
      allow(File).to receive(:directory?).and_return(false)
      allow(File).to receive(:file?).and_return(false)
      allow(File).to receive(:exist?).and_return(false)
      book_ui = BookUserInterface.new
      expect(book_ui.books).to eq([])
    end
  end

  describe '#create_book' do
    it 'creates a new book and saves it to a file' do
      book_user_interface = BookUserInterface.new
      expect(book_user_interface.books.count).to eq 0

      allow(book_user_interface).to receive(:handle_title_input).and_return('1984')
      allow(book_user_interface).to receive(:handle_author_input).and_return('George Orwell')

      book_user_interface.create_book
      expect(book_user_interface.books.count).to eq 1
      expect(book_user_interface.books.first['title']).to eq '1984'
      expect(book_user_interface.books.first['author']).to eq 'George Orwell'
    end
  end

  describe '#list_all_books' do
    before :each do
      @book_user_interface = BookUserInterface.new
    end

    it 'outputs a message when there are no books in the list' do
      expect { @book_user_interface.list_all_books }.to output("No books found on the list\n\n").to_stdout
    end

    it 'outputs the title and author of all books in the list' do
      @book_user_interface.books = [{ 'title' => 'Title 1', 'author' => 'Author 1' },
                                    { 'title' => 'Title 2', 'author' => 'Author 2' }]
      expected_output = "Title: Title 1, Author: Author 1\nTitle: Title 2, Author: Author 2\n"
      expect { @book_user_interface.list_all_books }.to output(expected_output).to_stdout
    end
  end
end
