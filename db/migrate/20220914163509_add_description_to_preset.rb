class AddDescriptionToPreset < ActiveRecord::Migration[7.0]
  def change
    add_column :presets, :description, :text, default: ""
  end
end
