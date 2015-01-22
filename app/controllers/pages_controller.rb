class PagesController < ApplicationController
  include BasicFilters

  def index
    @pages = Source.find(params[:source_id]).pages
  end


  def show
    @page = Source.find(params[:source_id]).find_by_number(params[:number])
  end


  # def new
  #   @page = Source.find(params[:source_id]).pages.new
  # end


  # def create
  #   @page = Page.new(page_params)
  #
  #   if @page.save
  #     flash.now[:success] = 'New page created.'
  #     redirect_to @page
  #   else
  #     render 'new'
  #   end
  # end


  def edit
    @page = Source.find(params[:source_id]).find_by_number(params[:number])
  end


  def update
    @page = Source.find(params[:source_id]).find_by_number(params[:number])

    if @page.update(page_params)
      flash.now[:success] = 'Page updated successfully.'
      redirect_to @page
    else
      render 'edit'
    end
  end


  def destroy
  end


  private

  def select_params
    params.permit(:fields)
  end

  def sort_params
    params.permit(:sort)
  end

  def limit_params
    params.permit(:limit)
  end

  def page_params
    params.require(:page).permit(
      :number,
      :text,
      :image
    )
  end

end
