class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if params[:post].present?
      file = params[:post][:image]
      File.open(Rails.root.join('app','assets','images', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
      @post.image = file.original_filename
    end
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if params[:post].present? && params[:post][:image].present?
      file = params[:post][:image]
      File.open(Rails.root.join('app','assets','images', file.original_filename), 'wb') do |f|
        f.write(file.read)
      end
      params[:post][:image] = file.original_filename
    end
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:comment,:image, :user_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
