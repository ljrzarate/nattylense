class CreatePresets < ActiveRecord::Migration[7.0]
  def change
    create_table :presets do |t|
      t.string :title

      t.timestamps
    end
  end
end
