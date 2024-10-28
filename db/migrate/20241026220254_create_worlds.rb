class CreateWorlds < ActiveRecord::Migration[7.2]
  def change
    create_table :worlds do |t|
      t.string :name
      t.integer :port

      t.timestamps
    end
  end
end
