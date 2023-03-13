class PostsController < ApplicationController
  def index
    posts = SocialNetwork::PostService.new.call

    render json: posts
  end
end
