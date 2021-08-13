require "json"

data_categories = JSON.parse(File.read("data/categories.json"), symbolize_names: true)

puts "Start seeding"
Category.destroy_all

puts "Seeding categories"
data_categories.each do |category|
  category_data = category.slice(:name, :description)
  new_category = Category.new(category_data)
  io_path = category[:cover][:io_path]
  filename = category[:cover][:filename]
  new_category.cover.attach(io: File.open(io_path), filename: filename)
  puts "Category not created.\nErrors: #{new_category.errors.full_messages}" unless new_category.save
end
puts "Finish seeding categories"
