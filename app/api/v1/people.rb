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





      # /affiliations
      desc 'List affiliations associated with a Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/affiliations', root: 'affiliations' do
        render Person.find(permitted_params[:id]).affiliations
      end


      # /picture
      desc 'Primary photo associated with Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/picture', root: 'source' do
        render Person.find(permitted_params[:id]).picture || {}
      end


      # /events
      desc 'List events associated with a Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/events', root: 'events' do
        render Person.find(permitted_params[:id]).events
      end


      # /photos
      desc 'List photos associated with a Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/photos', root: 'sources' do
        render Person.find(permitted_params[:id]).photos
      end


      # /sources
      desc 'List sources associated with a Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/sources', root: 'sources' do
        render Person.find(permitted_params[:id]).sources
      end


      # /citations
      desc 'List citations associated with a Person'
      params do
        requires :id, type: String, desc: 'Person ID or Slug'
      end
      get ':id/citations', root: 'citations' do
        render Person.find(permitted_params[:id]).citations
      end

    end
  end
end
