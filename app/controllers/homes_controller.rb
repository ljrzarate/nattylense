class HomesController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.all
  end

  def search
    @posts = Post.tagged_with(params[:tag])
  end
end
