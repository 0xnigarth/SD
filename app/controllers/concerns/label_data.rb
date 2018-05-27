class LabelData
  attr_reader :tracking_number
  attr_reader :carrier
  attr_reader :parcel

  def initialize(tracking_number, carrier, par_data)
    @tracking_number = tracking_number
    @carrier = carrier
    @parcel = par_data
  end
end
