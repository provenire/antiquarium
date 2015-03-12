module V1
  class Annotations < Grape::API

    # Params
    helpers do
      params :ident do
        requires :id, type: Integer, desc: 'Annotation ID'
      end

      params :mutable do
        requires :page_id,     type: Integer
        optional :tagged_id,   type: Integer
        optional :tagged_type, type: String
        optional :name,        type: String
        optional :description, type: String
        optional :location,    type: Hash
      end
    end


    # Endpoints
    resource :annotations do

      # Create
      desc 'Create annotation'
      params { includes :mutable }
      post do
        set_papertrail_user!
        Annotation.create!(mutable_params)
      end


      # Read
      desc 'Annotation'
      params { includes :ident }
      get ':id' do
        Annotation.find(permitted_params[:id])
      end


      # Update
      desc 'Update Annotation'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Annotation.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag an annotation for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Annotation.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /page
        desc 'Page annotated'
        get 'page', root: 'page' do
          render Annotation.find(permitted_params[:id]).page
        end

        # /source
        desc 'Source annotated'
        get 'source', root: 'source' do
          render Annotation.find(permitted_params[:id]).source
        end
      end

    end
  end
end
