class PlacesController < ApplicationController
  include BasicFilters

  def index
    @places = Place.order(:name).page(params[:page])
    render json: @places, meta: { total_pages: @places.total_pages, total_count: @places.total_count }
  end


  def show
    @place = Place.find(params[:id]).decorate
  end


  def new
    @place = Place.new
  end


  def create
    @place = Place.new(place_params)

    if @place.save
      flash.now[:success] = 'New place created.'
      redirect_to @place
    else
      render 'new'
    end
  end


  def edit
    @place = Place.find(params[:id])
  end


  def update
    @place = Place.find(params[:id])

    if @place.update(place_params)
      flash.now[:success] = 'Place updated successfully.'
      redirect_to @place
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

  def place_params
    params.require(:place).permit(
    :name,
    :description
    )
  end

end
