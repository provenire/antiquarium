module V1
  class Pages < Grape::API
    resource :pages do

      # Index
      desc 'Source pages'
      params do
        requires :source_id, type: String, desc: 'Source ID or Slug'
      end
      get ':source_id/pages' do
        Source.find(permitted_params[:source_id]).pages
      end


      # Show
      desc 'Page'
      params do
        requires :source_id, type: String, desc: 'Source ID or Slug'
        requires :number,    type: String, desc: 'Page number'
      end
      get ':source_id/pages/:number' do
        Source.find(permitted_params[:source_id]).find_by_number(permitted_params[:number])
      end

    end
  end
end
