require "test_helper"

class FindingShelvesTest < ActiveSupport::TestCase

  def setup
    Location.destroy_all

    location = Location.create(identifier: 1, display_name: "Ebene 1")

    shelf = location.shelves.create(identifier: 1)
    shelf.segments.create(identifier: 1, interval_begin: "AAA", interval_end: "AAA", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "AAA", interval_end: "AAA", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 3, interval_begin: "AAB", interval_end: "AAB", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 4, interval_begin: "AAB", interval_end: "AAB", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(identifier: 2)
    shelf.segments.create(identifier: 1, interval_begin: "AAC", interval_end: "AAC", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "AAC", interval_end: "AAC", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 3, interval_begin: "AAD", interval_end: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 4, interval_begin: "AAD", interval_end: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(identifier: 3)
    shelf.segments.create(identifier: 1, interval_begin: "AAD", interval_end: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "AAE", interval_end: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 3, interval_begin: "AAE", interval_end: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 4, interval_begin: "AAE", interval_end: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(identifier: 4)
    shelf.segments.create(identifier: 1, interval_begin: "AAF", interval_end: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "AAF", interval_end: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)


    location = Location.create(identifier: 2, display_name: "Ebene 2")
    shelf = location.shelves.create(identifier: 1)
    shelf.segments.create(identifier: 1, interval_begin: "AAF", interval_end: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "BAA", interval_end: "BAA", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 3, interval_begin: "BAA", interval_end: "BAA", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 4, interval_begin: "BAB", interval_end: "BAB", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(identifier: 2)
    shelf.segments.create(identifier: 1, interval_begin: "BAC", interval_end: "BAC", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(identifier: 2, interval_begin: "BAD", interval_end: "BAD", utilisation: 0.9, width: 100, no_of_levels: 5)

    @shelf_finder = ShelfFinder.new
  end

  def test_AAA4242
    result = @shelf_finder.find("AAA4242")
    binding.pry

    assert_equal "Ebene 1", result.locations[0].title

    assert_equal "Regal 1", result.locations[0].shelves[0].title
    assert_equal "1",       result.locations[0].shelves[0].segments[0].title
    assert_equal "2",       result.locations[0].shelves[0].segments[1].title
  end

  # def test_AAD
  #   result = @shelf_finder.find("AAD")
  #   assert_equal "Ebene 1", result.locations[0].title

  #   assert_equal "Regal 2", result.locations[0].shelves[0].title
  #   assert_equal "3",       result.locations[0].shelves[0].segments[0].title
  #   assert_equal "4",       result.locations[0].shelves[0].segments[1].title

  #   assert_equal "Regal 3", result.locations[0].shelves[1].title
  #   assert_equal "1",       result.locations[0].shelves[1].segments[0].title
  # end

end
