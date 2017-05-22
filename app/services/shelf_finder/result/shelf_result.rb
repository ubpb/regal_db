class ShelfFinder::Result

  class ShelfResult < BaseResult
    attr_reader :identifier
    attr_reader :segments

    def initialize(identifier)
      @identifier = identifier
      @segments   = []
    end

    def add_segment(segment)
      @segments << segment unless @segments.include?(segment)
    end
  end

end
