module V1
  class Affiliations < Grape::API
    resource :affiliations do

      # Show
      desc 'Affiliation'
      params do
        requires :id, type: String, desc: 'Affiliation ID or Slug'
      end
      get ':id' do
        Affiliation.find(permitted_params[:id])
      end

    end
  end
end
