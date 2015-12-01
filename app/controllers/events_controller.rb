class EventsController < ApplicationController
  before_action :set_event, only: [:update, :destroy]

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to :back
    end
  end

  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @event.destroy
    redirect_to :back, notice: 'Event was successfully destroyed.'
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :hackathon_id, :datetime)
  end
end
