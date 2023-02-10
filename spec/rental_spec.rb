require 'rspec'

describe Rental do
  let(:book) { { 'title' => 'The Great Gatsby' } }
  let(:person) { { 'name' => 'John Doe', 'id' => '123456', 'class' => 'English Literature' } }
  let(:rental) { Rental.new('2022-01-01', book, person) }

  it 'has a date' do
    expect(rental.date).to eq('2022-01-01')
  end

  it 'has a book' do
    expect(rental.book).to eq(book)
  end

  it 'has a person' do
    expect(rental.person).to eq(person)
  end

  it 'converts to JSON' do
    expected_json = { 'date' => '2022-01-01', 'title' => 'The Great Gatsby', 'name' => 'John Doe', 'id' => '123456',
                      'class' => 'English Literature' }
    expect(rental.to_json).to eq(expected_json)
  end
end
