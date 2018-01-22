class Api::ShelfFinderController < Api::ApplicationController

  def show
    result = ShelfFinder.new.find(params[:code])

    if result.present?
      render(json: result)
    else
      head :not_found
    end
  end

end
