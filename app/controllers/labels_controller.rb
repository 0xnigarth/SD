class LabelsController < ApplicationController
  require 'fedex'
  require 'pp'
  def index
    carrier = FedexCarrier.new('./public/labels.json')
    puts carrier.label_data.first.inspect
    @data  = carrier.stored_data
  end
end
