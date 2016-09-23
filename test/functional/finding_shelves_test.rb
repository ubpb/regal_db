require "test_helper"

class FindingShelvesTest < ActiveSupport::TestCase

  def setup
    Location.destroy_all

    location = Location.create(title: "Ebene 1")
    shelf = location.shelves.create(title: "Regal 1")
    shelf.segments.create(title: "1", start_signature: "AAA0000000", end_signature: "AAAZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "AAA0000000", end_signature: "AAAZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "3", start_signature: "AAB0000000", end_signature: "AABZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "4", start_signature: "AAB0000000", end_signature: "AABZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(title: "Regal 2")
    shelf.segments.create(title: "1", start_signature: "AAC0000000", end_signature: "AACZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "AAC0000000", end_signature: "AACZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "3", start_signature: "AAD0000000", end_signature: "AADZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "4", start_signature: "AAD0000000", end_signature: "AADZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(title: "Regal 3")
    shelf.segments.create(title: "1", start_signature: "AAD0000000", end_signature: "AADZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "AAE0000000", end_signature: "AAEZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "3", start_signature: "AAE0000000", end_signature: "AAEZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "4", start_signature: "AAE0000000", end_signature: "AAEZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(title: "Regal 4")
    shelf.segments.create(title: "1", start_signature: "AAF0000000", end_signature: "AAFZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "AAF0000000", end_signature: "AAFZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)


    location = Location.create(title: "Ebene 2")
    shelf = location.shelves.create(title: "Regal 1")
    shelf.segments.create(title: "1", start_signature: "AAF0000000", end_signature: "AAFZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "BAA0000000", end_signature: "BAAZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "3", start_signature: "BAA0000000", end_signature: "BAAZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "4", start_signature: "BAB0000000", end_signature: "BABZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)

    shelf = location.shelves.create(title: "Regal 2")
    shelf.segments.create(title: "1", start_signature: "BAC0000000", end_signature: "BACZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)
    shelf.segments.create(title: "2", start_signature: "BAD0000000", end_signature: "BADZZZZZZZ", utilisation: 0.9, width: 100, no_of_levels: 5)


    @shelf_finder = ShelfFinderService.new
  end

  def test_AAA4242
    result = @shelf_finder.find("AAA4242")
    result.to_s
    binding.pry
    assert_equal "Ebene 1", result.locations[0].title

    assert_equal "Regal 1", result.locations[0].shelves[0].title
    assert_equal "1",       result.locations[0].shelves[0].segments[0].title
    assert_equal "2",       result.locations[0].shelves[0].segments[1].title
  end

  def test_AAD
    result = @shelf_finder.find("AAD")
    assert_equal "Ebene 1", result.locations[0].title

    assert_equal "Regal 2", result.locations[0].shelves[0].title
    assert_equal "3",       result.locations[0].shelves[0].segments[0].title
    assert_equal "4",       result.locations[0].shelves[0].segments[1].title

    assert_equal "Regal 3", result.locations[0].shelves[1].title
    assert_equal "1",       result.locations[0].shelves[1].segments[0].title
  end

end
