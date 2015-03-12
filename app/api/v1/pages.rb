module V1
  class Pages < Grape::API

    # Params
    helpers do
      params :ident do
        requires :id, type: Integer, desc: 'Page ID'
      end
    end


    # Endpoints
    resource :pages do

      # Show
      desc 'Page'
      params { includes :ident }
      get ':id' do
        Page.find(permitted_params[:id])
      end



      # Endpoints
      params { includes :ident }
      namespace ':id' do
        # /source
        desc 'Page source'
        get 'source', root: 'source' do
          render Page.find(permitted_params[:id]).source
        end

        # /annotations
        desc 'Page annotations'
        get 'annotations', root: 'annotations' do
          render Page.find(permitted_params[:id]).annotations
        end
      end

    end
  end
end
