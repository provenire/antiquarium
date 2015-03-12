module V1
  class Affiliations < Grape::API
    include Grape::Kaminari

    # Params
    helpers do
      params :ident do
        requires :id, type: String, desc: 'Affiliation ID or Slug'
      end

      params :mutable do
        requires :person_id,   type: Integer
        requires :place_id,    type: Integer
        optional :description, type: String
        optional :title,       type: String
        optional :start_date,  type: Date
        optional :end_date,    type: Date
        optional :current,     type: Boolean
      end
    end


    # Endpoints
    resource :affiliations do

      # Index
      desc 'List affiliations'
      paginate per_page: 10
      get do
        list = paginate(Affiliation.order(:id))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Create
      desc 'Create affiliation'
      params { includes :mutable }
      post do
        set_papertrail_user!
        Affiliation.create!(mutable_params)
      end


      # Read
      desc 'Affiliation'
      params { includes :ident }
      get ':id' do
        Affiliation.find(permitted_params[:id])
      end


      # Update
      desc 'Update affiliation'
      params { includes :ident, :mutable }
      put ':id' do
        set_papertrail_user!
        resource = Affiliation.find(permitted_params[:id])
        resource.update!(mutable_params)
        resource
      end


      # Delete
      desc 'Flag an affiliation for deletion'
      params { includes :ident }
      delete ':id' do
        set_papertrail_user!
        resource = Affiliation.find(permitted_params[:id])
      end



      # Edges
      params { includes :ident }
      namespace ':id' do
        # /person
        desc 'Affiliated Person'
        get 'person', root: 'person' do
          render Affiliation.find(permitted_params[:id]).person
        end

        # /place
        desc 'Affiliated Place'
        get ':id/place', root: 'place' do
          render Affiliation.find(permitted_params[:id]).place
        end
      end

    end
  end
end
