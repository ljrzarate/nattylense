class Preset < ApplicationRecord
  validate :file_size_and_format, on: :create
  validates :title, presence: true
  validates :price, presence: true
  validates :before_file, presence: true
  validates :after_file, presence: true

  has_one_attached :before_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [500, 500]
    attachable.variant :standart, resize_to_limit: [1024, 768]
  end

  has_one_attached :after_file do |attachable|
    attachable.variant :thumb, resize_to_limit: [100, 100]
    attachable.variant :medium, resize_to_limit: [500, 500]
    attachable.variant :standart, resize_to_limit: [1024, 768]
  end

  def file_size_and_format
    errors.add(:base, "Before File should be less than 5MB") if before_file.blob.byte_size > 5.megabytes
    errors.add(:base, "Before Wrong format") unless before_file.blob.content_type.starts_with?('image/')

    errors.add(:base, "After File should be less than 5MB") if after_file.blob.byte_size > 5.megabytes
    errors.add(:base, "After Wrong format") unless after_file.blob.content_type.starts_with?('image/')
  end

  def before_thumb_variant
    self.before_file.variant(:thumb)
  end
end
