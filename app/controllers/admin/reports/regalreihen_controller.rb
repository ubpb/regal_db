class Admin::Reports::RegalreihenController < Admin::Reports::ApplicationController

  def index
    @form = Admin::Reports::Forms::RegalreihenForm.new
  end

  def create
    @form = Admin::Reports::Forms::RegalreihenForm.new(form_params)

    if @form.valid?
      @shelves = Shelf.includes(:segments)
                      .where(location: Location.find_by(identifier: @form.location_id))
                      .where(identifier: @form.start_row..@form.end_row) #.first.total_width
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:location_id, :start_row, :end_row)
  end

end
