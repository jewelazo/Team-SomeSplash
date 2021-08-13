require "json"

all_categories = JSON.parse(File.read("data/categories.json"), symbolize_names: true)
all_photos = JSON.parse(File.read("data/photos.json"), symbolize_names: true)

puts "Start initialize the seed "
Photo.destroy_all
Category.destroy_all

puts "Seeding categories"
all_categories.each do |category|
  category_data = category.slice(:name, :description)
  new_category = Category.new(category_data)
  io_path = category[:cover][:io_path]
  filename = category[:cover][:filename]
  new_category.cover.attach(io: File.open(io_path), filename: filename)
  puts "Category not created. Errors: #{new_category.errors.full_messages}" unless new_category.save
end
puts "Finish seeding categories"

puts "Seeding photos"
all_photos.each do |photo|
  category=Category.find_by(name: photo[:category])
  data_photo = {
      title: photo[:title],
      description: photo[:description],
      category: category }
  new_photo = Photo.new(data_photo)
  io_path = photo[:image][:io_path]
  filename = photo[:image][:filename]
  new_photo.image.attach(io: File.open(io_path), filename: filename)
  puts "Photo not created. Errors: #{new_photo.errors.full_messages}" unless new_photo.save
end
puts "Finish seeding photos"
