class Admin::EventsController < Admin::BaseController
  before_action :find_event, only: %i[show edit update destroy]
  def index
    @events = Event.all
  end

  def show; end

  def new
    @event = Event.new
  end

  def edit; end

  def create
    @event = current_admin.events.build(event_params)
    if @event.save
      redirect_to admin_event_path(@event)
    else
      render :new
    end
  end

  def update
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path
  end

  private

  def find_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :body, :published, :image, :admin_id)
  end
end
