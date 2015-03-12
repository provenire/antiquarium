module V1
  class Annotations < Grape::API
    resource :annotations do

      # Show
      desc 'Annotation'
      params do
        requires :id, type: String, desc: 'Annotation ID'
      end
      get ':id' do
        Annotation.find(permitted_params[:id])
      end


      # /page
      desc 'Page annotated'
      params do
        requires :id, type: String, desc: 'Annotation ID'
      end
      get ':id/page', root: 'page' do
        render Annotation.find(permitted_params[:id]).page
      end


      # /source
      desc 'Source annotated'
      params do
        requires :id, type: String, desc: 'Annotation ID'
      end
      get ':id/source', root: 'source' do
        render Annotation.find(permitted_params[:id]).source
      end

    end
  end
end
