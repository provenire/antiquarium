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

    end
  end
end
