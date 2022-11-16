require 'date'
require './ruby_classes/book'

describe Book do
  before :each do
    @book = Book.new(title: 'Title', publisher: 'George Martin', cover_state: 'bad', publish_date: Date.parse('2015-01-30'))
  end

  it 'validates that only accepts three arguments' do
    expect { Book.new('Fred Astor', 'bad', '2022-10-10', 'The Lord of the rings') }.to raise_error(ArgumentError)
  end

  it 'should detect the book title' do
    expect(@book.title).to eq 'Title'
  end

  it 'should detect the book publisher' do
    expect(@book.publisher).to eq 'George Martin'
  end

  it 'should detect the book cover_state' do
    expect(@book.cover_state).to eq 'bad'
  end

  it 'should detect the book publish_date' do
    expect(@book.publish_date).to eq Date.parse('2015-01-30')
  end
end
