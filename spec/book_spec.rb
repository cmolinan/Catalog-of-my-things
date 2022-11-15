require_relative '../ruby_classes/book'
describe Book do
  describe Book.new('George Martin', 'bad', '2015-01-30') do
    it { is_expected.to have_attributes(publisher: 'George Martin') }
    it { is_expected.to have_attributes(cover_state: 'bad') }
    it { is_expected.to have_attributes(publish_date: '2015-01-30') }
  end

  it 'validates that only accepts three arguments' do
    expect { Book.new('Fred Astor', 'bad', '2022-10-10', 'The Lord of the rings') }.to raise_error(ArgumentError)
  end

  before(:each) do
    @book = Book.new('John Mathews', 'good', '2011-01-10')
  end
  it 'validates if returns a class instance' do
    expect(@book).to be_instance_of Book
  end
  it 'validates parameters' do
    expect(@book.publisher).to eq('John Mathews')
    expect(@book.cover_state).to eq('good')
    expect(@book.publish_date).to eq('2011-01-10')
  end

  it 'should returns true' do
    expect(@book.move_to_archive).to eq true
  end
end
