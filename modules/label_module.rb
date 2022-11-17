require './ruby_classes/label'
require 'json'
require 'date'

module LabelsDataController
  def load_labels
    file = './json_files/labels.json'
    data = []
    if File.exist?(file) && File.read(file) != ''
      JSON.parse(File.read(file)).each do |element|
        data.push(Label.new(element['title'], element['color']))
      end
    end
    data
  end

  def save_labels
    data = []
    @labels.each do |label|
      data.push({ title: label.title, color: label.color })
    end
    File.write('./json_files/labels.json', JSON.generate(data))
  end
end
