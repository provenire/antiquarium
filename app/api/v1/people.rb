module V1
  class People < Grape::API
    include Grape::Kaminari

    resource :people do

      # Index
      desc 'List people'
      paginate per_page: 10
      get do
        list = paginate(Person.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id' do
        Person.find(permitted_params[:id])
      end

    end
  end
end
