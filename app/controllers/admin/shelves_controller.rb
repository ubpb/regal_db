class Admin::ShelvesController < Admin::ApplicationController

  before_action :load_location, only: [:index, :new, :create]


  def index
    @shelves = @location.shelves
  end

  def new
    last_identifier = @location.shelves.last&.identifier || 0
    @shelf = @location.shelves.new(
      identifier: last_identifier + 1
    )
  end

  def create
    @shelf = @location.shelves.new(shelf_params)
    if @shelf.save
      flash[:success] = "Regal erfolgreich angelegt"
      redirect_to(admin_location_shelves_path(@location))
    else
      render(:new)
    end
  end

private

  def load_location
    @location = Location.find(params[:location_id])
  end

  def shelf_params
    params.require(:shelf).permit(:identifier)
  end

end
