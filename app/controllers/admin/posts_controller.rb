class Admin::PostsController < ApplicationController

  before_filter :authenticate_admin_user!
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @posts = Post.all.order(id: :desc)
    respond_with(@posts)
  end

  def show
    respond_with(@post)
  end

  def new
    @post = Post.new
    respond_with(@post)
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [:admin,@post], notice: 'Post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    @post.update(post_params)
    respond_with([:admin,@post])
  end

  def destroy
    @post.destroy
    respond_with([:admin,@post])
  end

  private
    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content, :author_name, :released_date, :is_released)
    end
end
