class Parcel
  attr_reader :length
  attr_reader :width
  attr_reader :height
  attr_reader :weight
  attr_reader :distance_unit
  attr_reader :mass_unit

  def initialize(length,width,height,weight,distance_unit,mass_unit)
    @length = length
    @width   = width
    @height = height
    @weight = weight
    @distance_unit = distance_unit
    @mass_unit = mass_unit
  end
end
