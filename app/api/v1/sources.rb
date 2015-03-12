module V1
  class Sources < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: String, desc: 'Source ID or Slug'
      end

      params :mutable do
        optional :name,         type: String
        optional :description,  type: String
        optional :authors,      type: String
        optional :date_created, type: Date
        optional :attribution,  type: String
        optional :image,        type: String
        optional :document,     type: String
        optional :identifier,   type: String
      end
    end


    # Endpoints
    resource :sources do

      # Index
      desc 'List sources'
      paginate per_page: 10
      get do
        list = paginate(Source.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create a source'
      params do
        use      :mutable
        requires :name, type: String
      end
      post do
        set_papertrail_user!
        Source.create!(mutable_params)
      end


      # Read
      desc 'Show a source'
      params { includes :ident }
      get ':id' do
        Source.find(permitted_params[:id])
      end


      # Update
      desc 'Update a source'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Source.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag a source for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Source.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /pages
        desc 'Source pages'
        get 'pages', root: 'pages' do
          render Source.find(permitted_params[:id]).pages
        end

        # /pages/:number
        desc 'Page of source'
        params do
          includes :ident
          requires :number, type: String, desc: 'Page number'
        end
        get 'pages/:number', root: 'pages' do
          render Source.find(permitted_params[:id]).pages.find_by_number(permitted_params[:number])
        end

        # /citations
        desc 'Citations'
        get 'citations', root: 'citations' do
          render Source.find(permitted_params[:id]).citations
        end

        # /annotations
        desc 'Annotations'
        get 'annotations', root: 'annotations' do
          render Source.find(permitted_params[:id]).annotations
        end
      end

    end
  end
end
