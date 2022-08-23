class HomesController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all.uniq
    @posts = []
    @tags.each_with_index do |tag, index|
      @posts << {
        tag_id: tag.id,
        post: Post.find(Post.tagged_with(tag).pluck(:id)).sample
      }
    end

  end

  def search
    @posts = Post.tagged_with(params[:tag])
  end
end
