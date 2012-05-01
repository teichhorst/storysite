class StoriesController < ApplicationController
  
  def show
    @story = Story.find(params[:id])
    @pages = @story.pages
    @page = Page.paginate(:page => params[:page])
  end
  
  def index
   @stories = Story.limit(20)
  end
  
  def create
    @story = Story.new(params[:story])
    @story.user_id = current_user.id
    if @story.save
      #Handle a successful save.
      flash[:success] = "Story Successfully Created!"
      redirect_to current_user
    else
      redirect_to current_user
      flash[:error] = "The story must have a title!"
    end
  end
  
  def destroy
    @story = Story.find(params[:id])
    @page = Page.find(params[:id])
    Story.find(params[:id]).destroy
    flash[:success] = "Story deleted."
    redirect_to current_user
  end
  
  
end
