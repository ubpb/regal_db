Location.destroy_all
location = Location.create!(identifier: 1)

shelf = location.shelves.create!(identifier: 1)
shelf.segments.create!(identifier: 1, interval_begin: "JZUK", interval_end: "JZUN", utilisation: 0.9, width: 100, no_of_levels: 5)
shelf.segments.create!(identifier: 2, interval_begin: "JZUO", interval_end: "JZUP", utilisation: 0.9, width: 100, no_of_levels: 5)
#shelf.segments.create!(identifier: 3, interval_begin: "AAB", interval_end: "AAB", utilisation: 0.9, width: 100, no_of_levels: 5)
#shelf.segments.create!(identifier: 4, interval_begin: "AAB", interval_end: "AAB", utilisation: 0.9, width: 100, no_of_levels: 5)

# shelf = location.shelves.create!(identifier: 2)
# shelf.segments.create!(identifier: 1, interval_begin: "AAC", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 2, interval_begin: "AAC", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 3, interval_begin: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 4, interval_begin: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)

# shelf = location.shelves.create!(identifier: 3)
# shelf.segments.create!(identifier: 1, interval_begin: "AAD", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 2, interval_begin: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 3, interval_begin: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 4, interval_begin: "AAE", utilisation: 0.9, width: 100, no_of_levels: 5)

# shelf = location.shelves.create!(identifier: 4)
# shelf.segments.create!(identifier: 1, interval_begin: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 2, interval_begin: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)

# location = Location.create!(identifier: 2)

# shelf = location.shelves.create!(identifier: 1)
# shelf.segments.create!(identifier: 1, interval_begin: "AAF", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 2, interval_begin: "BAA", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 3, interval_begin: "BAA", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 4, interval_begin: "BAB", utilisation: 0.9, width: 100, no_of_levels: 5)

# shelf = location.shelves.create!(identifier: 2)
# shelf.segments.create!(identifier: 1, interval_begin: "BAC", utilisation: 0.9, width: 100, no_of_levels: 5)
# shelf.segments.create!(identifier: 2, interval_begin: "BAD", utilisation: 0.9, width: 100, no_of_levels: 5)

