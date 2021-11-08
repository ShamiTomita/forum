class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @forum = Forum.find(params[:forum_id])
    @post = @forum.posts.create(post_params)
    @post.user_id = current_user.id if current_user
    if @post.save
      redirect_to forum_path(@forum)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:comment)
  end
end
