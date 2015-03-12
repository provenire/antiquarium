module V1
  class Pages < Grape::API
    resource :pages do

      # Index
      desc 'Source pages'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      get do
        Source.find(permitted_params[:id]).pages
      end


      # Show
      desc 'Page'
      params do
        requires :id,     type: String, desc: 'Source ID or Slug'
        requires :number, type: String, desc: 'Page number'
      end
      get ':number' do
        Source.find(permitted_params[:id]).pages.find_by_number(permitted_params[:number])
      end

    end
  end
end
