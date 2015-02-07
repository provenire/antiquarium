class AffiliationsController < ApplicationController
  include BasicFilters

  # def index
  #   @affiliations = Affiliation.all.limit(10).decorate
  # end


  def show
    @affiliation = Affiliation.find(params[:id]).decorate
    @person      = @affiliation.person.decorate
    @place       = @affiliation.place.decorate
  end


  def new
    @affiliation = Affiliation.new
  end


  def create
    @affiliation = Affiliation.new(affiliation_params)

    if @affiliation.save
      flash.now[:success] = 'New affiliation created.'
      redirect_to @affiliation
    else
      render 'new'
    end
  end


  def edit
    @affiliation = Affiliation.find(params[:id])
  end


  def update
    @affiliation = Affiliation.find(params[:id])

    if @affiliation.update(affiliation_params)
      flash.now[:success] = 'Affiliation updated successfully.'
      redirect_to @affiliation
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

  def affiliation_params
    params.require(:affiliation).permit(
      :person,
      :place,
      :description,
      :title,
      :start_date,
      :end_date,
      :title
    )
  end

end
