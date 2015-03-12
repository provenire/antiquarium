module V1
  class Pages < Grape::API
    resource :pages do

      # Show
      desc 'Page'
      params do
        requires :id, type: String, desc: 'Page ID'
      end
      get ':id' do
        Page.find(permitted_params[:id])
      end


      # /source
      desc 'Page source'
      params do
        requires :id, type: String, desc: 'Page ID'
      end
      get ':id/source', root: 'source' do
        render Page.find(permitted_params[:id]).source
      end


      # /annotations
      desc 'Page annotations'
      params do
        requires :id, type: String, desc: 'Page ID'
      end
      get ':id/annotations', root: 'annotations' do
        render Page.find(permitted_params[:id]).annotations
      end

    end
  end
end
