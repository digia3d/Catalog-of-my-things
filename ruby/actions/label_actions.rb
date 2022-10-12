require_relative '../file_writer'
require_relative '../file_reader'
require_relative '../label'

def write_labels(labels)
  labels = labels.map do |label|
    {
      title: label.title,
      color: label.color
    }
  end
  file_writer = FileWriter.new(labels, 'labels.json')
  file_writer.write
end

def load_labels
  file_reader = FileReader.new('labels.json')
  labels = file_reader.read
  labels.map do |label|
    Label.new(
      label['title'],
      label['color']
    )
  end
end
