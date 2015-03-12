module V1
  class Affiliations < Grape::API
    include Grape::Kaminari

    resource :affiliations do

      # Index
      desc 'List affiliations'
      paginate per_page: 10
      get do
        list = paginate(Affiliation.order(:id))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Affiliation'
      params do
        requires :id, type: String, desc: 'Affiliation ID or Slug'
      end
      get ':id' do
        Affiliation.find(permitted_params[:id])
      end



      # /person
      desc 'Affiliated Person'
      params do
        requires :id, type: String, desc: 'Affiliation ID or Slug'
      end
      get ':id/person', root: 'person' do
        render Affiliation.find(permitted_params[:id]).person
      end


      # /place
      desc 'Affiliated Place'
      params do
        requires :id, type: String, desc: 'Affiliation ID or Slug'
      end
      get ':id/place', root: 'place' do
        render Affiliation.find(permitted_params[:id]).place
      end

    end
  end
end
