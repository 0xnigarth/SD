class AddFedexDatumProperties < ActiveRecord::Migration[5.2]
  def change
    add_column :fedex_label_data, :tracking_number, :string
    add_column :fedex_label_data, :file_width, :real
    add_column :fedex_label_data, :file_height, :real
    add_column :fedex_label_data, :file_weight, :real
    add_column :fedex_label_data, :file_length, :real
    add_column :fedex_label_data, :file_distance_unit, :string
    add_column :fedex_label_data, :file_mass_unit, :string
    add_column :fedex_label_data, :api_width, :real
    add_column :fedex_label_data, :api_height, :real
    add_column :fedex_label_data, :api_length, :real
    add_column :fedex_label_data, :api_distance_unit, :string
    add_column :fedex_label_data, :api_weight, :real
    add_column :fedex_label_data, :api_weight_unit, :string
  end
end
