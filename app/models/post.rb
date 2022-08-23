class Post < ApplicationRecord
  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [400, 300]
    attachable.variant :big, resize_to_limit: [1280, 900]
  end
end
