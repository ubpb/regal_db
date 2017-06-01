class Api::ShelfFinderController < Api::ApplicationController

  def show
    result = ShelfFinder.new.find(params[:code])

    if result.present?
      render(json: result)
    else
      render(nothing: true, status: 404)
    end
  end

end
