class FedexCarrier < CarrierBase
  attr_reader :label_data
  attr_reader :stored_data

  def initialize(file_path)
    super(file_path, 'fedex')
    @api = get_api_isntance
    @label_data = get_file_data
    save_label_data
    @stored_data = get_stored_data
  end

  def get_api_isntance
    Fedex::Shipment.new(key: 'O21wEWKhdDn2SYyb',
                        password: 'db0SYxXWWh0bgRSN7Ikg9Vunz',
                        account_number: '510087780',
                        meter: '119009727',
                        mode: 'test')
  end

  # This method is implemetation specific. We're using LabelData for instances but this can be modified
  def get_file_data
    items.map do |it|
      p_hash = it['parcel']
      p = Parcel.new(p_hash['length'], p_hash['width'], p_hash['height'], p_hash['weight'], p_hash['distance_unit'], p_hash['mass_unit'])
      LabelData.new(it['tracking_number'], it['carrier'], p)
    end
  end

  def save_label_data
    unless label_data_present?
      @label_data.each do |dat|
        response = @api.track(tracking_number: dat.tracking_number)
        weight_unit = response[0].details[:shipment_weight][:units]
        weight_value = response[0].details[:shipment_weight][:value]
        length = response[0].details[:package_dimensions][:length]
        width = response[0].details[:package_dimensions][:width]
        height = response[0].details[:package_dimensions][:height]
        api_distance_unit = response[0].details[:package_dimensions][:units]
        # binding.pry

        new_fedex_label = FedexLabelDatum.new
        new_fedex_label.tracking_number = dat.tracking_number
        new_fedex_label.file_width = dat.parcel.width
        new_fedex_label.file_height = dat.parcel.height
        new_fedex_label.file_weight = dat.parcel.weight
        new_fedex_label.file_length = dat.parcel.length
        new_fedex_label.file_distance_unit = dat.parcel.distance_unit
        new_fedex_label.file_mass_unit = dat.parcel.mass_unit
        new_fedex_label.api_width = width
        new_fedex_label.api_height = height
        new_fedex_label.api_length = length
        new_fedex_label.api_distance_unit = api_distance_unit
        new_fedex_label.api_weight = weight_value
        new_fedex_label.api_weight_unit = weight_unit

        new_fedex_label.save
      end
    end
  end

  def label_data_present?
    ids = @label_data.map do |dat|
      dat.tracking_number.to_s
    end
    ids.count == FedexLabelDatum.where(tracking_number: ids).count
  end

  def get_stored_data
    FedexLabelDatum.all
  end
end
