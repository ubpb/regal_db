class Admin::ShelfFinderController < Admin::ApplicationController

  def index
    @form = Admin::Forms::ShelfFinderForm.new
  end

  def create
    @form = Admin::Forms::ShelfFinderForm.new(form_params)

    if @form.valid?
      @result = ShelfFinder.new.find(
        @form.search_string,
        include_closed_stack: @form.include_closed_stack?
      )
    end

    render :index
  end

private

  def form_params
    params.require(:form).permit(:search_string, :include_closed_stack)
  end

end
