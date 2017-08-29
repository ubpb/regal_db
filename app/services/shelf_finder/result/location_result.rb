class ShelfFinder::Result

  class LocationResult < BaseResult
    attr_reader :identifier
    attr_reader :display_name
    attr_reader :closed_stack
    attr_reader :shelves

    def initialize(location)
      @identifier   = location.identifier
      @display_name = location.display_name
      @closed_stack = location.closed_stack?
      @shelves      = []
    end

    def add_shelf(shelf)
      @shelves << shelf unless @shelves.include?(shelf)
    end
  end

end
