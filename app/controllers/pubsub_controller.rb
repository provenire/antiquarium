class PubsubController < ApplicationController
  protect_from_forgery except: :auth

  def auth
    if pusher_params["channel_name"] == user_channel
      response = Pusher[pusher_params["channel_name"]].authenticate(pusher_params["socket_id"])
      render json: response
    else
      render text: 'Forbidden', status: '403'
    end
  end


  private

  def user_channel
    "private-user.#{current_user.id}"
  end

  def pusher_params
    params.permit(:channel_name, :socket_id)
  end

end
