class ShelfFinder

  def find(code, include_closed_stack: false)
    code, collection_code = split_code_and_collection_code(code)

    segments = find_segments(
      code,
      code,
      include_closed_stack: include_closed_stack,
      collection_code: collection_code
    )

    Result.new(segments.to_a)
  end

  def find_segments(code_begin, code_end, include_closed_stack: false, collection_code: nil)
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

    if collection_code.present?
      arel = arel.where("find_in_set(?, locations.collection_codes) > 0", collection_code)
    end

    arel = arel.order(
      "locations.identifier, shelves.identifier, segments.identifier"
    )

    arel
  end

private

  def split_code_and_collection_code(code)
    code.split("|").map(&:strip).map(&:presence)
  end

  def normalize_code(code)
    norm_code = if code.starts_with?(/\d\d/) # Journal "code"
      code[/\d\d[a-z]{1}\d{1,2}/i] || code
    else
      code[/[a-z]{3,4}/i] || code
    end

    norm_code&.upcase
  end

end
