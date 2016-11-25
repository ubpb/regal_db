class ShelfFinderService

  def find(code)
    segments = find_segments(code)
    Result.new(segments)
  end

  class Result
    attr_reader :segments, :data

    def initialize(segments)
      @segments = segments.to_a
      shelves   = segments.map(&:shelf).uniq
      locations = shelves.map(&:location).uniq

      # Build a location graph that only includes relevant locations, shelves and segments
      @data = locations.map do |location|
        {
          location: location,
          shelves: shelves.select{|shelf| shelf.location == location}.map do |shelf|
            {
              shelf: shelf,
              segments: segments.select{|segment| segment.shelf == shelf}.map do |segment|
                {
                  segment: segment
                }
              end
            }
          end
        }
      end
    end

    def present?
      @segments.present?
    end

    def to_s
      @data.map do |location|
        shelves = location[:shelves].map do |shelf|
          segments = shelf[:segments].map{|segment| segment[:segment].identifier}.join(", ")

          "Regal #{shelf[:shelf].identifier} – Segment(e): #{segments}"
        end.join("; ")

        "Ebene #{location[:location].identifier}: #{shelves}"
      end.join("\n")
    end

  end

private

  def normalize_code(code)
    norm_code = code[/[a-z]{3,4}/i] || code
    norm_code&.upcase
  end

  def find_segments(code)
    Segment.includes(
      :shelf => :location
    ).where(
      "interval_begin <= :code AND interval_end >= :code",
      code: normalize_code(code)
    )
  end

end
