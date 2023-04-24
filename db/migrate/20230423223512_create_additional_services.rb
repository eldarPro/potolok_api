class CreateAdditionalServices < ActiveRecord::Migration[7.0]
  def change
    create_table :additional_services do |t|
      t.string     :title, null: false
      t.integer    :price, null: false
      t.integer    :price_install, null: false
      t.text       :description
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
