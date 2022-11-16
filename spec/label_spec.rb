require './ruby_classes/label'
require './ruby_classes/book'

describe Label do
  before :each do
    @label = Label.new(id: 2, title: 'Lord of the Rings', color: 'Blue')
  end

  it 'should detect the label id' do
    expect(@label.id).to eq 2
  end

  it 'should detect the label title' do
    expect(@label.title).to eq 'Lord of the Rings'
  end

  it 'should detect the label color' do
    expect(@label.color).to eq 'Blue'
  end

  it 'validates if returns a class instance' do
    expect(@label).to be_instance_of Label
  end

  it 'should detect the label items' do
    book = Book.new(title: 'Title', publisher: 'Publisher', cover_state: 'bad', publish_date: Date.parse('2022/10/10'))
    @label.add_item(book)
    expect(@label.items.include?(book)).to eq true
    expect(book.label).to eq @label

    book2 = Book.new(title: 'Title', publisher: 'Publisher', cover_state: 'bad', publish_date: Date.parse('2022/10/10'))
    book2.label = @label
    expect(@label.items.include?(book2)).to eq true
    expect(book2.label).to eq @label
  end
end
