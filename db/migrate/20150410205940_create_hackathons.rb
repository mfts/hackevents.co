class CreateHackathons < ActiveRecord::Migration
  def change
    create_table :hackathons do |t|
      t.string :title
      t.text :description
      t.string :country
      t.string :city
      t.string :url
      t.datetime :date_start
      t.datetime :date_end
      t.string :venue
      t.string :address
      t.text :challenge
      t.text :sponsors
      t.text :awards
      t.text :schedule
      t.boolean :application
      t.datetime :application_deadline

      t.timestamps null: false
    end
  end
end
