class Admin::Reports::RegalreihenController < Admin::Reports::ApplicationController

  def index
    @form = Admin::Reports::Forms::RegalreihenForm.new
  end

  def create
    @form = Admin::Reports::Forms::RegalreihenForm.new(form_params)

    if @form.valid?
      location = Location.find(@form.location_id)

      @form.start_row = 1 if @form.start_row.blank?
      @form.end_row = location.shelves.count if @form.end_row.blank?

      @shelves = Shelf.includes(
        :segments
      ).where(
        location: location
      ).where(
        identifier: @form.start_row..@form.end_row
      ).order(
        "identifier"
      )
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:location_id, :start_row, :end_row)
  end

end
