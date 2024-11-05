# frozen_string_literal: true

class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :name, null: false, limit: 100
      t.text :biography

      t.timestamps
    end
  end
end
