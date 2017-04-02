require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Category.new
  t.id = row['ID']
  t.name = row['Name']
  t.description = row['Description']
  t.sfw = row['SFW']
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Category.count} rows in the categories table"

csv_text = File.read(Rails.root.join('lib', 'seeds', 'questions.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Question.new
  t.id = row['id']
  t.name = row['name']
  t.description = row['description']
  t.input_type = row['input_type']
  t.options = row['options']
  t.category_id = row['category_id']
  t.parent_id = row['parent_id']
  t.genitalia = row['genitalia']
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Question.count} rows in the questions table"
