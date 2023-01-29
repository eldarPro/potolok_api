class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :lastname, null: false
      t.string :name, null: false
      t.string :patronymic, null: false
      t.string :company, null: false

      t.timestamps
    end

    User.create(lastname: 'test', name: 'test', patronymic: 'test', company: 'test')

  end
end
