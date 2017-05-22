class ShelfFinder::Result

  class LocationResult < BaseResult
    attr_reader :identifier
    attr_reader :display_name
    attr_reader :shelves

    def initialize(identifier, display_name)
      @identifier   = identifier
      @display_name = display_name
      @shelves      = []
    end

    def add_shelf(shelf)
      @shelves << shelf unless @shelves.include?(shelf)
    end
  end

end
