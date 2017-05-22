class ShelfFinder::Result
  class BaseResult

    def ==(other)
      self.identifier == other.identifier
    end

  end
end
