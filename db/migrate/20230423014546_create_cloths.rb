class CreateCloths < ActiveRecord::Migration[7.0]
  def change
    create_table :cloths do |t|
      t.string     :title, null: false
      t.integer    :price, null: false
      t.integer    :price_install, null: false
      t.integer    :price_corner, null: false
      t.boolean    :default, null: false, default: false
      t.string     :color, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
