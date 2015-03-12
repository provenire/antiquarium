module V1
  class Sources < Grape::API
    include Grape::Kaminari

    resource :sources do

      # Index
      desc 'List sources'
      paginate per_page: 10
      get do
        list = paginate(Source.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Source'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      route_param :id do
        get do
          Source.find(permitted_params[:id])
        end

        # Pages
        mount V1::Pages
      end

    end
  end
end
