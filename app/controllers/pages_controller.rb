class PagesController < ApplicationController

  def index
   @pages = Page.paginate(:page => params[:page])
   
  end

  def show
    
  end
  
  def new
    @page = Story.find(params[:story_id]).pages.new
  end

  def create
    @page = Story.find(params[:story_id]).pages.create(params[:page])
    @page.user_id = current_user.id

    if @page.save
      #Handle a successful save.
      flash[:success] = "Page Successfully Created!"
      redirect_to @page.story
    else
      flash[:error] = "The page must have content! "
      redirect_to @page.story
    end
  end

  def destroy
    @story.page.destroy
    flash[:success] = "Page deleted."
    redirect_to @story
  end

end