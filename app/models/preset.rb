class Preset < ApplicationRecord
  validate :file_size_and_format, on: :create
  validates :title, presence: true
  validates :price, presence: true
  validates :file, presence: true
  
  has_one_attached :file do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :standart, resize_to_limit: [1024, 768]
  end

  def file_size_and_format
    errors.add(:base, "File should be less than 5MB") if file.blob.byte_size > 5.megabytes
    errors.add(:base, "Wrong format") if file.blob.content_type.starts_with?('image/')
  end
end
