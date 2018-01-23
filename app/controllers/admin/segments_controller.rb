class Admin::SegmentsController < Admin::ApplicationController

  before_action :load_shelf, only: [:index, :new, :create]
  before_action :load_location, only: [:index, :new, :create]


  def index
    @segments = @shelf.segments
  end

  def new
    previous_shelf = @shelf.location.shelves.where("identifier < ?", @shelf.identifier).last

    last_identifier   = @shelf.segments.last&.identifier || 0
    last_interval_end = @shelf.segments.last&.interval_end || previous_shelf&.segments&.last&.interval_end
    last_no_of_levels = @shelf.segments.last&.no_of_levels || previous_shelf&.segments&.last&.no_of_levels || 0
    last_width        = @shelf.segments.last&.width || 100
    last_utilisation  = @shelf.segments.last&.utilisation || 1

    @segment = @shelf.segments.new(
      identifier: last_identifier + 1,
      interval_begin: last_interval_end,
      no_of_levels: last_no_of_levels,
      width: last_width,
      utilisation: last_utilisation
    )
  end

  def create
    @segment = @shelf.segments.new(segment_params)
    if @segment.save
      flash[:success] = "Regalsegment erfolgreich angelegt"

      if params[:save_and_new].present?
        redirect_to(new_admin_shelf_segment_path(@shelf))
      else
        redirect_to(admin_shelf_segments_path(@shelf))
      end
    else
      render(:new)
    end
  end

  def edit
    @segment = Segment.includes(:shelf).find(params[:id])
  end

  def update
    @segment = Segment.includes(:shelf).find(params[:id])
    if @segment.update_attributes(segment_params)
      flash[:success] = "Regalsegment erfolgreich aktualisiert"
      redirect_to(admin_shelf_segments_path(@segment.shelf))
    else
      render(:edit)
    end
  end

  def destroy
    @segment = Segment.includes(:shelf).find(params[:id])
    @segment.destroy
    flash[:success] = "Regalsegment #{@segment.identifier} wurde gelöscht"
    redirect_to(admin_shelf_segments_path(@segment.shelf))
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
      :identifier, :interval_begin, :interval_end, :utilisation, :width, :no_of_levels, :notes, :special_usage
    )
  end

end
