class ShelfFinder::Result

  class SegmentResult < BaseResult
    attr_reader :identifier

    def initialize(identifier)
      @identifier = identifier
    end
  end

end
