# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# Needs to create the list of tags
  tag_list = [ { name: "Nature"},  { name: "Portait" }, { name: "People" }, { name: "Architecture" }, { name: "Animals" }, { name: "Sports" }, { name: "Travel"} ]

# needs to create a post per tag

  tag_list.each do |tag|
    @post = Post.create(
      title: tag[:name], description: "This is a post on #{tag[:name]}", tag_list: tag[:name])  
  end
