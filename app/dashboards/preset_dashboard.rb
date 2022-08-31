require "administrate/base_dashboard"

class PresetDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    price: Field::Number,
    file: Field::ActiveStorage
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    title
    price
  ].freeze


  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    price
    file
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    price
    file
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
