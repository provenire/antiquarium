module V1
  class Citations < Grape::API
    include Grape::Kaminari

    resource :citations do

      # Index
      desc 'List citations'
      paginate per_page: 10
      get do
        list = paginate(Citation.order(:id))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Citation'
      params do
        requires :id, type: String, desc: 'Citation ID'
      end
      get ':id' do
        Citation.find(permitted_params[:id])
      end


      # /source
      desc 'Source cited'
      params do
        requires :id, type: String, desc: 'Citation ID'
      end
      get ':id/source', root: 'source' do
        render Citation.find(permitted_params[:id]).source
      end

    end
  end
end
