class CarrierBase
  attr_reader :label_data
  attr_reader :carrier_name

  def initialize(file_path, carrier_name)
    @file_path = file_path
    @carrier_name = carrier_name
    @api = get_api_isntance
    @label_data = get_file_data
    @stored_data = []
  end

  def items
    file = File.read(@file_path)
    JSON.parse(file)
  end

  def track_label(label_id)
    @api.track(label_id)
  end

  # The following methods are implementation specific these should be overriten in child classes

  protected

  def get_api_isntance
    nil
  end

  def get_file_data
    []
  end

  def get_stored_data
    []
  end

  def label_data_present?
    false
  end
end
