class SourcesController < ApplicationController
  include BasicFilters

  def index
    @sources = Source.all.limit(10).decorate
  end


  def show
    @source = Source.find(params[:id])
  end


  def new
    @source = Source.new
  end


  def create
    @source = Source.new(source_params)

    if @source.save
      flash.now[:success] = 'New source created.'
      redirect_to @source
    else
      render 'new'
    end
  end


  def edit
    @source = Source.find(params[:id])
  end


  def update
    @source = Source.find(params[:id])

    if @source.update(source_params)
      flash.now[:success] = 'Source updated successfully.'
      redirect_to @source
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

  def source_params
    params.require(:source).permit(
      :name,
      :description,
      :authors,
      :date_created,
      :attribution,
      :thumbnail,
      :document
    )
  end

end
