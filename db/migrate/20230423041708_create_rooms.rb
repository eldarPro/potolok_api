class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :title
      t.jsonb  :data
      t.float  :linear_mtrs, null: false, default: 0
      t.float  :square_mtrs, null: false, default: 0
      t.references :project, null: false, foreign_key: true
      t.references :cloth,   foreign_key: true
      t.timestamps
    end
  end
end
