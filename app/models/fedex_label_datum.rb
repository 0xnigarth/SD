class FedexLabelDatum < ApplicationRecord
  def carrier
    'fedex'
  end

  def total_weight; end

  def has_over_weight?; end

  def carrier
    'fedex'
  end

  def file_in_inches?
    file_distance_unit == 'IN'
  end

  def file_in_cm?
    file_distance_unit == 'CM'
  end

  def file_in_pounds?
    file_mass_unit == 'LB'
  end

  def file_weight_in_kg
    file_in_pounds? ? file_weight * 0.45359237 : file_weight
  end

  def file_width_api_in_cm
    file_in_inches? ? file_width / 0.39370 : file_width
  end

  def file_height_api_in_cm
    file_in_inches? ? file_height / 0.39370 : file_height
  end

  def file_volumetric_weight
    (file_weight_in_kg * file_width_api_in_cm * file_height_api_in_cm) / 5000
  end


#####################################################################
  def api_in_inches?
    api_distance_unit == 'IN'
  end

  def api_in_cm?
    api_distance_unit == 'CM'
  end

  def api_in_pounds?
    api_weight_unit == 'LB'
  end

  def api_weight_in_kg
    api_in_pounds? ? api_weight * 0.45359237 : api_weight
  end

  def api_width_in_cm
    api_in_inches? ? api_width / 0.39370 : api_width
  end

  def api_height_in_cm
    api_in_inches? ? api_height / 0.39370 : api_height
  end

  def api_length_in_cm
    api_in_inches? ? api_length / 0.39370 : api_length
  end

  def api_volumetric_weight
    (api_length_in_cm * api_width_in_cm * api_height_in_cm) / 5000
  end

  def ceil_weights
    {'file_weight_in_kg': file_weight_in_kg.ceil, 'file_volumetric_weight': file_volumetric_weight.ceil, 'api_volumetric_weight': api_volumetric_weight.ceil, 'api_weight_in_kg': api_weight_in_kg.ceil}
  end

  def max_weight_txt
    ceil_weights.sort_by { |name, value| value }[0][0]
  end

  def file_weights
    {'file_weight_in_kg': file_weight_in_kg.ceil, 'file_volumetric_weight': file_volumetric_weight.ceil}
  end

  def api_weights
    {'api_volumetric_weight': api_volumetric_weight.ceil, 'api_weight_in_kg': api_weight_in_kg.ceil}
  end

  def max_weight_api
api_weights.sort_by { |name, value| value }[0][0]
  end

  def max_weight_file
file_weights.sort_by { |name, value| value }[0][0]
  end

  def max_weight_file_value
    file_weights[max_weight_file]
  end

  def max_weight_api_value
    api_weights[max_weight_api]
  end



  def has_over_weight?
    max_weight_api_value > max_weight_file_value
  end



  def amount_of_over_weight
    (max_weight_file_value - max_weight_api_value).abs
  end
end
