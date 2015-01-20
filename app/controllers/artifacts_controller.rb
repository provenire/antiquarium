class ArtifactsController < ApplicationController
  include BasicFilters

  def index
    @artifacts = Artifact.select(select_params).order(sort_params).limit(limit_params)
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

  def artifact_params
    params.require(:artifact).permit(
      :name,
      :description,
      :alternate_names => [],
      :artist,
      :dimensions,
      :date_created,
      :group
    )
  end

end
