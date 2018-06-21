class CreateEvents < ActiveRecord::Migration[4.2]
  def change
    create_table :events do |t|
      t.string      :time_start
      t.string      :name
      t.text        :description
      t.references  :hackathon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
