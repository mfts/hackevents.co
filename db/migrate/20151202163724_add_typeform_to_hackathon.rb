class AddTypeformToHackathon < ActiveRecord::Migration
  def change
    add_column :hackathons, :typeform, :string
  end
end
