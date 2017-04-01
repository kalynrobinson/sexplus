require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'categories.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Category.new
  t.id = row['id']
  t.name = row['name']
  t.description = row['description']
  t.sfw = row['SFW']
  t.save
  puts "#{t.name} saved"
end

puts "There are now #{Category.count} rows in the categories table"
