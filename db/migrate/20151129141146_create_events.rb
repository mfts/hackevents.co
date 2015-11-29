class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime    :datetime
      t.string      :name
      t.text        :description
      t.references   :hackathon, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
