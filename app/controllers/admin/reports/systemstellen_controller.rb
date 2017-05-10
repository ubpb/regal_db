class Admin::Reports::SystemstellenController < Admin::Reports::ApplicationController

  def index
    @form = Admin::Reports::Forms::SystemstellenForm.new
  end

  def create
    @form = Admin::Reports::Forms::SystemstellenForm.new(form_params)

    if @form.valid?
      @segments = Segment.includes(:shelf => :location)
                         .where("interval_begin >= ? AND interval_end <= ?", @form.start_interval, @form.end_interval)
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:start_interval, :end_interval)
  end

end