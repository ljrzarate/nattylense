require "administrate/base_dashboard"

class PresetDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    title: Field::String,
    price: Field::Number,
    before_file: Field::ActiveStorage.with_options(
      index_display_preview: true,
      index_preview_size: [150, 150],
      show_preview_size: [800, 800]
    ),
    after_file: Field::ActiveStorage.with_options(
      index_display_preview: true,
      variant: [150, 150],
      show_preview_size: [100, 100]
    ),
    description: Field::Text
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    before_file
    title
    price
  ].freeze


  SHOW_PAGE_ATTRIBUTES = %i[
    id
    title
    price
    before_file
    after_file
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    price
    description
    before_file
    after_file
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
