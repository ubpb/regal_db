class ShelfFinder::Result
  attr_reader :locations

  def initialize(segments)
    @locations = []

    segments.each do |segment|
      location = @locations.find{|_| _.identifier == segment.shelf.location.identifier} || begin
        new_location = LocationResult.new(segment.shelf.location.identifier, segment.shelf.location.display_name)
        @locations << new_location
        new_location
      end

      shelf = location.shelves.find{|_| _.identifier == segment.shelf.identifier} || begin
        new_shelf = ShelfResult.new(segment.shelf.identifier)
        location.add_shelf(new_shelf)
        new_shelf
      end

      shelf.add_segment(SegmentResult.new(segment.identifier))
    end
  end

  def present?
    @locations.present?
  end

  def segments
    @locations.map(&:shelves).flatten.map(&:segments).flatten
  end

end
