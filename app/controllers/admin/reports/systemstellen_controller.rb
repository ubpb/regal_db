class Admin::Reports::SystemstellenController < Admin::Reports::ApplicationController

  def index
    @form = Admin::Reports::Forms::SystemstellenForm.new
  end

  def create
    @form = Admin::Reports::Forms::SystemstellenForm.new(form_params)

    if @form.valid?
      @segments = ShelfFinder.new.find_segments(
        @form.interval_begin,
        @form.interval_end,
        include_closed_stack: @form.include_closed_stack?
      )
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:interval_begin, :interval_end, :include_closed_stack)
  end

end
