class ShelfFinder::Result

  class SegmentResult < BaseResult
    attr_reader :identifier

    def initialize(segment)
      @identifier = segment.identifier
    end
  end

end
