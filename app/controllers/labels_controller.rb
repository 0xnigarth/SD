class LabelsController < ApplicationController
  require 'fedex'
  def index
    file = File.read('./public/labels.json')
    items = JSON.parse(file)
    @data = items.map do |it|
      p_hash = it['parcel']
      p = Parcel.new(p_hash['length'], p_hash['width'], p_hash['height'], p_hash['weight'], p_hash['distance_unit'], p_hash['mass_unit'])
      LabelData.new(it['tracking_number'], it['carrier'], p)
    end

    fedex = Fedex::Shipment.new(key: 'O21wEWKhdDn2SYyb',
                                password: 'db0SYxXWWh0bgRSN7Ikg9Vunz',
                                account_number: '510087780',
                                meter: '119009727',
                                mode: 'test')
    #results = fedex.track(:tracking_number => @data.first.tracking_number.to_s)

  #  puts results.inspect


  end
end
