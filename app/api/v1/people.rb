module V1
  class People < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: String, desc: 'Person ID or Slug'
      end

      params :mutable do
        optional :name,          type: String
        optional :description,   type: String
        optional :gender,        type: String
        optional :date_of_birth, type: Date
        optional :date_of_death, type: Date
        optional :nationality,   type: String
      end
    end


    # Endpoints
    resource :people do

      # Index
      desc 'List people'
      paginate per_page: 10
      get do
        list = paginate(Person.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create a person'
      params do
        use      :mutable
        requires :name, type: String
      end
      post do
        set_papertrail_user!
        Person.create!(mutable_params)
      end


      # Read
      desc 'Show a person'
      params { includes :ident }
      get ':id' do
        Person.find(permitted_params[:id])
      end


      # Update
      desc 'Update a person'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Person.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag a person for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Person.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /affiliations
        desc 'List affiliations associated with a Person'
        get 'affiliations', root: 'affiliations' do
          render Person.find(permitted_params[:id]).affiliations
        end

        # /picture
        desc 'Primary photo associated with Person'
        get 'picture', root: 'source' do
          render Person.find(permitted_params[:id]).picture || {}
        end

        # /events
        desc 'List events associated with a Person'
        get 'events', root: 'events' do
          render Person.find(permitted_params[:id]).events
        end

        # /photos
        desc 'List photos associated with a Person'
        get 'photos', root: 'sources' do
          render Person.find(permitted_params[:id]).photos
        end

        # /sources
        desc 'List sources associated with a Person'
        get 'sources', root: 'sources' do
          render Person.find(permitted_params[:id]).sources
        end

        # /citations
        desc 'List citations associated with a Person'
        get 'citations', root: 'citations' do
          render Person.find(permitted_params[:id]).citations
        end
      end

    end
  end
end
