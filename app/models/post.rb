class Post < ApplicationRecord
  before_save :check_image_attachment

  has_one_attached :image do |attachable|
    attachable.variant :small, resize_to_limit: [400, 300]
    attachable.variant :big, resize_to_limit: [1280, 900]
  end
  acts_as_taggable_on :tags

  def tag_names
    self.tag_list
  end

  private

  def check_image_attachment
    unless self.image.attached?
      self.image.attach(io: File.open(Rails.root.join('app', 'assets', 'images', 'img_1.jpg')), filename: 'img_1.jpg', content_type: 'image/jpg')
    end
  end
end
