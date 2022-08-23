require "administrate/base_dashboard"

class PostDashboard < Administrate::BaseDashboard

  ATTRIBUTE_TYPES = {
    id: Field::Number,
    description: Field::String,
    image: Field::ActiveStorage.with_options(
      destroy_url: proc do |_namespace, _resource, image|
        [:image_admin_post, { id: image.id }]
      end
    ),
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  COLLECTION_ATTRIBUTES = %i[
    id
    description
  ].freeze


  SHOW_PAGE_ATTRIBUTES = %i[
    id
    image
    description
    title
  ].freeze

  FORM_ATTRIBUTES = %i[
    title
    description
    image
  ].freeze

  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how posts are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(post)
  #   "Post ##{post.id}"
  # end
end
