class ShelfFinder

  def find(code)
    segments = find_segments(code)
    Result.new(segments)
  end

  def find_segments(code_begin, code_end = nil)
    code_end = code_begin unless code_end

    Segment.includes(
      :shelf => :location
    ).where(
      "interval_begin <= :code_begin AND interval_end >= :code_end",
      code_begin: normalize_code(code_begin),
      code_end: normalize_code(code_end)
    )
  end

private

  def normalize_code(code)
    norm_code = code[/[a-z]{3,4}/i] || code
    norm_code&.upcase
  end

end
