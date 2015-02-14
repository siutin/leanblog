class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit]

  respond_to :html

  def index
    @posts = Post.is_released.order(released_date: :desc)
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

end
