class EventsController < ApplicationController
	
	def index
		@events = Event.paginate(page: params[:page], per_page: 100).order(params[:sort])
	end

	def search
		@events = Event.where("EventDate BETWEEN ? AND ?", params[:q], params[:p])
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new(event_params)

		@event.save
		redirect_to @event
	end

	def edit
		@event = Event.find(params[:id])
	end

	def update
		if @event.update(event_params)
			redirect_to @event
		else
			render 'edit'
		end
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy

		redirect_to events_path
	end

	def show
		@event = Event.find(params[:id])
	end

	private
	def event_params
		params.require(:event).permit(:ScheduleGroup, :Person, :EventType,
			:EventDate, :EventTime, :Description, :City, :State, :CiteLink)
	end
end
