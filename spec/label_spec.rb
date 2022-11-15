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

  context 'Method add_item of Label Class' do
    it 'validates if returns 2 items' do
      item = Item.new('2019-05-21')
      @label.add_item(item)
      item = Item.new('2021-08-11')
      @label.add_item(item)
      total_items = @label.items.length
      expect(total_items).to eq 2
    end
  end
end
