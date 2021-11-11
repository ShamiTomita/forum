class ForumsController < ApplicationController


  def index
    initialize_search
    handle_search_name
    handle_filters
  end

  def new
    @forum = Forum.new
    @forum.posts.build(comment: 'first post')
  end

  def create
    @forum = Forum.create(forum_params)
    if @forum.save
      params[:forum][:posts_attributes]["0"]["forum_id"] = @forum.id
      redirect_to forum_path(@forum.id)
    else
      render :new
    end
  end


  def clear
    clear_session(:search_name, :filter_name, :filter)
    redirect_to forums_path
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

  def close
    @forum = Forum.find_by(id: params[:id])
    @forum.update_attribute(:status, false)
    redirect_to forum_path(@forum.id)

  end


  def destroy
  end

  private
    def forum_params
      params.require(:forum).permit(:name, :user_id, :status, :category,
      posts_attributes: [
        :comment,
        :user_id,
        :forum_id
        ])
    end

  def initialize_search
    @forums = Forum.all
    session[:search_name] ||= params[:search_name]
    session[:filter] = params[:filter]
    params[:filter_option] = nil if params[:filter_option] == ""
    session[:filter_option] = params[:filter_option]
  end

  def handle_search_name
    if session[:search_name]
      @forums = Forum.where("name LIKE ?", "%#{session[:search_name]}%")

    else
      @forums = Forum.all
    end
  end

  def handle_filters
    if session[:filter_option] && session[:filter] == "most_recent"
      @forums = Forums.most_recent
    elsif session[:filter_option] && session[:filter] == "category"
      @forums = Forum.where(category: session[:filter_option])
    elsif session[:filter_option] && session[:filter] == "by_popularity"
      @forums = Forum.by_popularity
    elsif session[:filter_option] && session[:filter] == "active"
      @forums = Forums.active
    end
  end
end
