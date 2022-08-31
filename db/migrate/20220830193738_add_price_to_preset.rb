class AddPriceToPreset < ActiveRecord::Migration[7.0]
  def change
    add_column :presets, :price, :float
  end
end
