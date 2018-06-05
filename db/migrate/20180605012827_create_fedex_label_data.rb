class CreateFedexLabelData < ActiveRecord::Migration[5.2]
  def change
    create_table :fedex_label_data do |t|

      t.timestamps
    end
  end
end
