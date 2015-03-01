module V1
  class Places < Grape::API
    include Grape::Kaminari

    resource :places do

      # Index
      desc 'List places'
      paginate per_page: 10
      get do
        list = paginate(Place.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Place'
      params do
        requires :id, type: String, desc: 'Place ID or Slug'
      end
      get ':id' do
        Place.find(permitted_params[:id])
      end

    end
  end
end
