class Admin::ShelfFinderController < Admin::ApplicationController

  def index
    @search_string = params[:search].try(:[], :q)
    @shelf_finder = ShelfFinder.new

    @result = @shelf_finder.find(@search_string) if @search_string.present?
  end

end
