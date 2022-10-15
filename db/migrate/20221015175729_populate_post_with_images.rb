require 'faker'

class PopulatePostWithImages < ActiveRecord::Migration[7.0]
  def up
    puts "Setting unlimit -n"
    system 'ulimit -n'

    folder_names = [
      "animals", "events", "fashion", "nature",
      "people", "portraits", "sexy", "travel", ]

    folder_names.each do |folder_name|
      folder_path = Rails.root.join('lib', 'seed_content', 'website', folder_name)
      files = Dir.glob("#{folder_path}/*")
      files.each do |file_name|
        file_name = file_name.split("/").last
        file_path = "#{folder_path}/#{file_name}"

        puts "Creating Post in #{folder_name}:"
        puts "Creating file: #{file_name}"
        post = Post.create!(
          title: folder_name,
          description: Faker::Games::WorldOfWarcraft.hero,
          tag_list: folder_name
        )

        puts "Post Created from file: #{file_name}"
        puts "Adding image..."



        post.image.attach(
          io: File.open(Rails.root.join('lib', 'seed_content', 'website', folder_name, file_name)),
          filename: file_name,
          content_type: 'image/jpg'
        )
        puts "Attached?: #{post.image.attached?}"
        puts "-" * 100
      end
    end
  end

  def down;end
end
