class Admin::Reports::SystemstellenController < Admin::Reports::ApplicationController

  def show
    @form = Admin::Reports::Forms::SystemstellenForm.new(query_params)
    @segments = get_segments(@form) if @form.valid?

    now = Time.zone.now
    @download_path = admin_reports_systemstellen_path(format: "xlsx", query: query_params)

    respond_to do |format|
      format.html
      format.xlsx {
        filename = [
          "systemstellen",
          I18n.l(now, format: "%Y-%m-%d").parameterize,
          I18n.l(now, format: "%H-%M").parameterize
        ].join("_")

        response.headers['Content-Disposition'] = "attachment; filename=\"#{filename}.xlsx\""
      }
    end
  end

  def create
    @form = Admin::Reports::Forms::SystemstellenForm.new(query_params)

    if @form.valid?
      redirect_to action: :show, query: query_params
    else
      redirect_to action: :show
    end
  end

private

  def query_params
    params[:query]&.permit(:interval_begin, :interval_end, :include_closed_stack)
  end

  def get_segments(form)
    ShelfFinder.new.find_segments(
      form.interval_begin,
      form.interval_end,
      include_closed_stack: form.include_closed_stack?
    )
  end

end
