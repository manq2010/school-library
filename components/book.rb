class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def to_json(*_args)
    { 'title' => @title, 'author' => @author, 'rentals' => @rentals }
  end
end
