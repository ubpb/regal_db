class Admin::Reports::RegalreihenController < Admin::Reports::ApplicationController

  def show
    @form = Admin::Reports::Forms::RegalreihenForm.new(query_params)
    @shelves = get_shelves(@form) if @form.valid?

    now = Time.zone.now
    @download_path = admin_reports_regalreihen_path(format: "xlsx", query: query_params)

    respond_to do |format|
      format.html
      format.xlsx {
        filename = [
          "regalreihen",
          I18n.l(now, format: "%Y-%m-%d").parameterize,
          I18n.l(now, format: "%H-%M").parameterize
        ].join("_")

        response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}.xlsx\""
      }
    end
  end

  def create
    @form = Admin::Reports::Forms::RegalreihenForm.new(query_params)

    if @form.valid?
      redirect_to action: :show, query: query_params
    else
      redirect_to action: :show
    end
  end

private

  def query_params
    params[:query]&.permit(:location_id, :start_row, :end_row, :expand_segments)
  end

  def get_shelves(form)
    location = Location.find(form.location_id)

    form.start_row = 1 if form.start_row.blank?
    form.end_row = location.shelves.count if form.end_row.blank?

    Shelf.includes(
      :segments
    ).where(
      location: location
    ).where(
      identifier: form.start_row..form.end_row
    ).order(
      "identifier"
    )
  end

end
