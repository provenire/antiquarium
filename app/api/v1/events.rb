module V1
  class Events < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: String, desc: 'Event ID or Slug'
      end

      params :mutable do
        optional :description,    type: String
        optional :date,           type: Date
        optional :status,         type: String
        optional :price_cents,    type: Integer
        optional :price_currency, type: String
        optional :failed,         type: Boolean
        optional :verb_id,        type: Integer
      end
    end


    # Endpoints
    resource :events do

      # Index
      desc 'List events'
      paginate per_page: 10
      get do
        list = paginate(Event.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create event'
      params { includes :mutable }
      post do
        set_papertrail_user!
        Event.create!(mutable_params)
      end


      # Read
      desc 'Event'
      params { includes :ident }
      get ':id' do
        Event.find(permitted_params[:id])
      end


      # Update
      desc 'Update Event'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Event.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag Event for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Event.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /artifacts
        desc 'List artifacts associated with an Event'
        get 'artifacts', root: 'artifacts' do
          render Event.find(permitted_params[:id]).artifacts
        end

        # /interactions
        desc 'List interactions associated with an Event'
        get 'interactions', root: 'interactions' do
          render Event.find(permitted_params[:id]).interactions
        end

        # /sources
        desc 'List sources associated with an Event'
        get 'sources', root: 'sources' do
          render Event.find(permitted_params[:id]).sources
        end

        # /citations
        desc 'List citations associated with an Event'
        get 'citations', root: 'citations' do
          render Event.find(permitted_params[:id]).citations
        end
      end

    end
  end
end
