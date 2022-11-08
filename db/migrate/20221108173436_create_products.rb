# frozen_string_literal: true

class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :pattern_name, null: false
      t.string :color_name, null: false
      t.jsonb :price, null: false
      t.jsonb :stock, null: false

      t.timestamps
    end
  end
end
