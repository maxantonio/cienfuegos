class AdminController < ApplicationController
  USERS = { "admin" => "admin" }
  before_action :authenticate
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @users_qty = User.count
    @posts_qty = Post.count
    @posts = Post.all
  end

  # GET /admin/1
  def show
  end

  # GET /admin/1/edit
  def edit
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to admin_path, notice: 'Post was successfully updated.'
    else
      render :edit
    end
  end

  # GET /admin/1/destroy
  def destroy
    @post.destroy
    redirect_to admin_index_path
  end

  private

    def authenticate
      authenticate_or_request_with_http_digest do |username|
        USERS[username]
      end
    end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body)
    end
end
