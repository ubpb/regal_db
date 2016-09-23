class Admin::SegmentsController < Admin::ApplicationController

  before_action :load_shelf, only: [:index, :new, :create]
  before_action :load_location, only: [:index, :new, :create]


  def index
    @segments = @shelf.segments
  end

  def new
    last_identifier   = @shelf.segments.last&.identifier || 0
    last_no_of_levels = @shelf.segments.last&.no_of_levels || 0
    last_width        = @shelf.segments.last&.width || 100
    last_utilisation  = @shelf.segments.last&.utilisation || 0

    @segment = @shelf.segments.new(
      identifier: last_identifier + 1,
      no_of_levels: last_no_of_levels,
      width: last_width,
      utilisation: last_utilisation
    )
  end

  def create
    @segment = @shelf.segments.new(segment_params)
    if @segment.save
      flash[:success] = "Regalsegment erfolgreich angelegt"
      redirect_to(admin_shelf_segments_path(@shelf))
    else
      render(:new)
    end
  end

private

  def load_shelf
    @shelf = Shelf.includes(:location).find(params[:shelf_id])
  end

  def load_location
    @location = @shelf.location
  end

  def segment_params
    params.require(:segment).permit(
      :identifier, :interval_begin, :interval_end, :utilisation, :width, :no_of_levels
    )
  end

end
