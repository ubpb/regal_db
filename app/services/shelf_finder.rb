class ShelfFinder

  def find(code)
    segments = find_segments(code)
    Result.new(segments)
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
