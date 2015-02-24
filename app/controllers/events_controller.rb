class EventsController < ApplicationController
  include BasicFilters

  def show
    @event = Event.find(params[:id])
    render json: @event
  end


  def new
    @event = Event.new
  end


  def create
    @event = Event.new(event_params)

    if @event.save
      flash.now[:success] = 'New event created.'
      redirect_to @event
    else
      render 'new'
    end
  end


  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])

    if @event.update(event_params)
      flash.now[:success] = 'Event updated successfully.'
      redirect_to @event
    else
      render 'edit'
    end
  end


  def destroy
  end


  private

  def select_params
    params.permit(:fields)
  end

  def sort_params
    params.permit(:sort)
  end

  def limit_params
    params.permit(:limit)
  end

  def event_params
    params.require(:event).permit(
      :description,
      :date,
      :verb,
      :status,
      :price_cents,
      :price_currency
    )
  end

end
