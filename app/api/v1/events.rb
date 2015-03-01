module V1
  class Events < Grape::API
    resource :events do

      # Show
      desc 'Event'
      params do
        requires :id, type: String, desc: 'Event ID or Slug'
      end
      get ':id' do
        Event.find(permitted_params[:id])
      end

    end
  end
end
