module V1
  class Places < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: String, desc: 'Place ID or Slug'
      end

      params :mutable do
        optional :name,          type: String
        optional :description,   type: String
      end
    end


    # Endpoints
    resource :places do

      # Index
      desc 'List places'
      paginate per_page: 10
      get do
        list = paginate(Place.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create a place'
      params do
        use      :mutable
        requires :name, type: String
      end
      post do
        set_papertrail_user!
        Place.create!(mutable_params)
      end


      # Read
      desc 'Show a place'
      params { includes :ident }
      get ':id' do
        Place.find(permitted_params[:id])
      end


      # Update
      desc 'Update a place'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Place.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag a place for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Place.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /affiliations
        desc 'List affiliations associated with a Place'
        get 'affiliations', root: 'affiliations' do
          render Place.find(permitted_params[:id]).affiliations
        end

        # /picture
        desc 'Primary photo associated with Place'
        get 'picture', root: 'source' do
          render Place.find(permitted_params[:id]).picture || {}
        end

        # /events
        desc 'List events associated with a Place'
        get 'events', root: 'events' do
          render Place.find(permitted_params[:id]).events
        end

        # /photos
        desc 'List photos associated with a Place'
        get 'photos', root: 'sources' do
          render Place.find(permitted_params[:id]).photos
        end

        # /sources
        desc 'List sources associated with a Place'
        get 'sources', root: 'sources' do
          render Place.find(permitted_params[:id]).sources
        end

        # /citations
        desc 'List citations associated with a Place'
        get 'citations', root: 'citations' do
          render Place.find(permitted_params[:id]).citations
        end
      end


    end
  end
end
