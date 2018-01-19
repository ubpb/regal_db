class Admin::Reports::SystemstellenController < Admin::Reports::ApplicationController

  def index
    @form = Admin::Reports::Forms::SystemstellenForm.new
  end

  def create
    @form = Admin::Reports::Forms::SystemstellenForm.new(form_params)

    if @form.valid?
      @segments = ShelfFinder.new.find_segments(
        @form.interval_begin, @form.interval_end
      ).order(
        "locations.identifier, shelves.identifier, segments.identifier"
      )

      if @form.ignore_closed_stack?
        @segments = @segments.reject{|s| s.shelf.location.closed_stack?}
      end

      if @form.only_closed_stack?
        @segments = @segments.reject{|s| !s.shelf.location.closed_stack?}
      end
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:interval_begin, :interval_end, :ignore_closed_stack, :only_closed_stack)
  end

end
