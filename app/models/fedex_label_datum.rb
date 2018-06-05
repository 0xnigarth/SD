class FedexLabelDatum < ApplicationRecord
  def carrier
    'fedex'
  end

  def total_weight; end

  def has_over_weight?; end

  def carrier
    'fedex'
  end

  def in_inches?
    api_distance_unit == 'IN'
  end

  def in_cm?
    api_distance_unit == 'CM'
  end

  def in_pounds?
    api_weight_unit == 'LB'
  end

  def api_weight_in_kg
    in_pounds? ? api_weight * 0.45359237 : api_weight
  end

  def api_width_in_cm
    in_inches? ? api_width / 0.39370 : api_width
  end

  def api_height_in_cm
    in_inches? ? api_height / 0.39370 : api_height
  end

  def volumetric_weight
    (api_weight_in_kg * api_width_in_cm * api_height_in_cm) / 5000
  end
end
