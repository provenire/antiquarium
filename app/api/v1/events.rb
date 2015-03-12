module V1
  class Events < Grape::API
    include Grape::Kaminari

    resource :events do

      # Index
      desc 'List events'
      paginate per_page: 10
      get do
        list = paginate(Event.order(:name))
        render list, { meta: { total_pages: list.total_pages, total_count: list.total_count } }
      end


      # Show
      desc 'Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id' do
        Event.find(permitted_params[:id])
      end


      # /artifacts
      desc 'List artifacts associated with an Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id/artifacts', root: 'artifacts' do
        render Event.find(permitted_params[:id]).artifacts
      end


      # /interactions
      desc 'List interactions associated with an Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id/interactions', root: 'interactions' do
        render Event.find(permitted_params[:id]).interactions
      end


      # /sources
      desc 'List sources associated with an Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id/sources', root: 'sources' do
        render Event.find(permitted_params[:id]).sources
      end


      # /citations
      desc 'List citations associated with an Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id/citations', root: 'citations' do
        render Event.find(permitted_params[:id]).citations
      end

    end
  end
end
