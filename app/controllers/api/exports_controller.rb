class Api::ExportsController < Api::ApplicationController

  CSV_DIVIDER = ";"

  def csv
    segments = Segment
      .joins(:shelf => :location)
      .order("segments.shelf_id, shelves.location_id")
      .pluck(
        "locations.identifier",
        "shelves.identifier",
        "segments.identifier",
        "segments.interval_begin",
        "segments.interval_end",
        "segments.special_usage",
        "segments.no_of_levels",
        "segments.width",
        "segments.utilisation",
        "segments.notes"
      )

    csv_header = [
      "Location",
      "Shelf",
      "Segment",
      "Interval Begin",
      "Interval End",
      "Special Usage",
      "No of Levels",
      "Width",
      "Utilisation",
      "Notizen"
    ]

    @csv_data = []
    @csv_data << csv_header.join(CSV_DIVIDER)
    @csv_data += segments.map{|s| s.join(CSV_DIVIDER)}

    send_data(@csv_data.join("\n"), type: "text/plain", filename: "shelves-export.csv", disposition: :attachment)
  end

end
