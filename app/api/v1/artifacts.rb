module V1
  class Artifacts < Grape::API
    include Grape::Kaminari

    resource :artifacts do

      # Index
      desc 'List artifacts'
      paginate per_page: 10
      get do
        list = paginate(Artifact.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id' do
        Artifact.find(permitted_params[:id])
      end






      # /picture
      desc 'Primary photo associated with Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id/picture', root: 'source' do
        render Artifact.find(permitted_params[:id]).picture || {}
      end


      # /events
      desc 'List events associated with an Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id/events', root: 'events' do
        render Artifact.find(permitted_params[:id]).events
      end


      # /photos
      desc 'List photos associated with an Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id/photos', root: 'sources' do
        render Artifact.find(permitted_params[:id]).photos
      end


      # /sources
      desc 'List sources associated with an Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id/sources', root: 'sources' do
        render Artifact.find(permitted_params[:id]).sources
      end


      # /citations
      desc 'List citations associated with an Artifact'
      params do
        requires :id, type: String, desc: 'Artifact ID or Slug'
      end
      get ':id/citations', root: 'citations' do
        render Artifact.find(permitted_params[:id]).citations
      end

    end
  end
end
