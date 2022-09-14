module TagHelper
  def all_tags
    ActsAsTaggableOn::Tag.all.uniq
  end
end
