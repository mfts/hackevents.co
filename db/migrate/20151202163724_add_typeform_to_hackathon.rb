class AddTypeformToHackathon < ActiveRecord::Migration[4.2]
  def change
    add_column :hackathons, :typeform, :string
  end
end
