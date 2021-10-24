class ForumsController < ApplicationController

  def new
    @forum = Forum.new
    @forum.posts.build(comment: 'first post')
  end

  def create
    @forum = Forum.create(forum_params)
    if @forum.save
      redirect_to forum_path(@forum)
    else
      render :new
    end
  end

  def index
    @forums = Forum.all
  end

  def show
    @forum = Forum.find_by(id: params[:id])
  end

  def edit
    @forum = Forum.find_by(id: params[:id])
  end

  def update
    @forum = Forum.find_by(id: params[:id])
    if @forum.update(forum_params)
      redirect_to forum_path(@forum)
    else
      render :edit
    end
  end



  def destroy
  end

  private
    def forum_params
      params.require(:forum).permit(:name, :user_id, :post,
      post_attributes: [
        :comment
        ])
    end
end
