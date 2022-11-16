require 'date'
require_relative '../ruby_classes/label'
describe Label do
  describe Label.new('Lord of the Rings', 'red') do
    it { is_expected.to have_attributes(title: 'Lord of the Rings') }
    it { is_expected.to have_attributes(color: 'red') }
  end

  it 'validates that only accepts two arguments' do
    expect { Label.new('Game of Thrones', 'blue', '2022-10-10') }.to raise_error(ArgumentError)
  end

  before(:each) do
    @label = Label.new('The Queen', 'red')
  end

  it 'validates if returns a class instance' do
    expect(@label).to be_instance_of Label
  end

  it 'validates parameters' do
    expect(@label.title).not_to eq('The King')
    expect(@label.color).to eq('red')
  end

  it 'should detect the label items' do
    book = Book.new('Publisher', 'bad', Date.parse('2022/10/10'))
    @label.add_item(book)
    expect(@label.items.include?(book)).to eq true
    expect(book.label).to eq @label

    book2 = Book.new('Publisher', 'bad', Date.parse('2022/10/10'))
    book2.label = @label
    expect(@label.items.include?(book2)).to eq true
    expect(book2.label).to eq @label
  end
end
