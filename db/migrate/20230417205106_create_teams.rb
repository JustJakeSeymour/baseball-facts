class CreateTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :venue

      t.timestamps
    end
  end
end
