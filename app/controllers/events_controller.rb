class EventsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_event, only: %w[show edit update destroy]
  def index
    @events = Event.where('date > ?', Time.now)
  end

  def new
    @event = Event.new
  end

  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to events_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def create
    @event = current_user.events.new(event_params)

    if @event.save
      Enrollment.create(event: @event, user: current_user)
      redirect_to events_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @event.destroy
      redirect_to events_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private
  def event_params
    params.require(:event).permit(:date)
  end

  private
  def set_event
    @event = Event.find(params[:id])
  end
end
