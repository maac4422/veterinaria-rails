class CreateRaces < ActiveRecord::Migration[5.0]
  def change
    create_table :races do |t|
      t.string :name
      t.string :state
      t.timestamps
    end
  end
end
