module V1
  class Citations < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: Integer, desc: 'Citation ID'
      end

      params :mutable do
        requires :source_id,  type: Integer
        requires :entry_id,   type: Integer
        requires :entry_type, type: String
        optional :number,     type: Integer
        optional :content,    type: String
      end
    end


    # Endpoints
    resource :citations do

      # Index
      desc 'List citations'
      paginate per_page: 10
      get do
        list = paginate(Citation.order(:id))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create citation'
      params { includes :mutable }
      post do
        set_papertrail_user!
        Citation.create!(mutable_params)
      end


      # Read
      desc 'Citation'
      params { includes :ident }
      get ':id' do
        Citation.find(permitted_params[:id])
      end


      # Update
      desc 'Update Citation'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Citation.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Delete a citation'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Citation.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /source
        desc 'Source cited'
        get 'source', root: 'source' do
          render Citation.find(permitted_params[:id]).source
        end
      end

    end
  end
end
