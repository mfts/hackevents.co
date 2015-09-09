namespace :hackathons do  
  task :generate_count => :environment do
    City.all.each do |city|
      city.hackathon_total_count = city.hackathons.count
      city.save
    end
  end
  task :migrate_to_city_id => :environment do
    puts Hackathon.count
    Hackathon.all.each_with_index do |hackathon, index|
      hackathon.city = City.where(name:hackathon.city_string).first
      hackathon.save
      puts index
    end
  end
end