module V1
  class Sources < Grape::API
    include Grape::Kaminari

    resource :sources do

      # Index
      desc 'List sources'
      paginate per_page: 10
      get do
        list = paginate(Source.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Source'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      get ':id' do
        Source.find(permitted_params[:id])
      end


      # /pages
      desc 'Source pages'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      get ':id/pages', root: 'pages' do
        render Source.find(permitted_params[:id]).pages
      end


      # /pages/:number
      desc 'Page of source'
      params do
        requires :id,     type: String, desc: 'Source ID or Slug'
        requires :number, type: String, desc: 'Page number'
      end
      get ':id/pages/:number', root: 'pages' do
        render Source.find(permitted_params[:id]).pages.find_by_number(permitted_params[:number])
      end


      # /citations
      desc 'Citations'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      get ':id/citations', root: 'citations' do
        render Source.find(permitted_params[:id]).citations
      end


      # /annotations
      desc 'Annotations'
      params do
        requires :id, type: String, desc: 'Source ID or Slug'
      end
      get ':id/annotations', root: 'annotations' do
        render Source.find(permitted_params[:id]).annotations
      end

    end
  end
end
