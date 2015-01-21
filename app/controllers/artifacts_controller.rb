class ArtifactsController < ApplicationController
  include BasicFilters

  def index
    @artifacts = Artifact.limit(10).decorate
  end


  def show
    @artifact = Artifact.find(params[:id])
  end


  def new
    @artifact = Artifact.new
  end


  def create
    @artifact = Artifact.new(artifact_params)

    if @artifact.save
      flash.now[:success] = 'New artifact created.'
      redirect_to @artifact
    else
      render 'new'
    end
  end


  def edit
    @artifact = Artifact.find(params[:id])
  end


  def update
    @artifact = Artifact.find(params[:id])

    if @artifact.update(artifact_params)
      flash.now[:success] = 'Artifact updated successfully.'
      redirect_to @artifact
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

  def artifact_params
    params.require(:artifact).permit(
      :name,
      :description,
      :artist,
      :dimensions,
      :date_created,
      :group,
      { :alternate_names => [] }
    )
  end

end
