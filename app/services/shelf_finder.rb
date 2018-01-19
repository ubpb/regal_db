class ShelfFinder

  def find(code, include_closed_stack: false)
    segments = find_segments(code, code, include_closed_stack: include_closed_stack).to_a
    Result.new(segments)
  end

  def find_segments(code_begin, code_end, include_closed_stack: false)
    arel = Segment.joins(
      :shelf => :location
    ).includes(
      :shelf => :location
    ).where(
      "segments.interval_begin <= :code_end AND :code_begin <= segments.interval_end",
      code_begin: normalize_code(code_begin),
      code_end: normalize_code(code_end)
    )

    if include_closed_stack
      arel = arel.where("locations.closed_stack = true OR locations.closed_stack = false")
    else
      arel = arel.where("locations.closed_stack = false")
    end

    arel = arel.order(
      "locations.identifier, shelves.identifier, segments.identifier"
    )

    arel
  end

private

  def normalize_code(code)
    norm_code = code[/[a-z]{3,4}/i] || code
    norm_code&.upcase
  end

end
