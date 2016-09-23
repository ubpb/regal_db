AutoStripAttributes::Config.setup do
  set_filter :upcase => false do |value|
    value&.upcase
  end
end
