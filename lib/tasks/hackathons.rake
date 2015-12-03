require 'rubygems'
require 'json'
require 'net/http'
require 'nokogiri'

namespace :hackathons do  
  task :generate_count => :environment do
    City.all.each do |city|
      city.hackathon_total_count = city.hackathons.count
      city.save
    end
  end
  task :generate_current_count => :environment do
    City.all.each do |city|
      city.hackathon_count = city.hackathons.where('date_start >= ?', Time.zone.now).count
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
  task :migrate_all_to_city_id => :environment do
    puts Hackathon.count
    Hackathon.all.each_with_index do |hackathon, index|
      hackathon.city = City.where(name:hackathon.city_string).first_or_create
      hackathon.save
      puts index
    end
  end
  task :update_cities_with_teleport => :environment do
    source = "http://developers.teleport.org/assets/urban_areas.json"
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    result = JSON.parse(data)
    result.each do |telecity|
      puts telecity[0]
      if City.find_by(name: telecity[0])
        city = City.find_by(name: telecity[0])
        puts "√"
        city.teleport_id = telecity[1]
        city.save
      end
    end
  end
  task :update_cities_with_source => :environment do
    source = "http://images.hackevents.de/city_source.json"
    resp = Net::HTTP.get_response(URI.parse(source))
    data = resp.body
    result = JSON.parse(data)
    result.each do |source|
      puts source['City']
      if City.find_by(name: source['City'])
        city = City.find_by(name: source['City'])
        puts "√"
        city.source_url = source['URL']
        city.source_name = source['Name']
        city.save
      end
    end
  end
  task :update_twitter_profile_image => :environment do
    base_url = "https://twitter.com/"
    User.all.each_with_index do |user, index|
      puts index
      url = base_url + user.twitter_account.username
      resp = Net::HTTP.get_response(URI.parse(url))
      unless resp.code == '404'
        doc = Nokogiri::HTML(resp.body)
        img = doc.xpath('//body/div/div/div/div/div/div/div/div/div/a/img/@src')
        user.twitter_account.profile_image = img.to_s.gsub('_400x400','')
        user.save
      else
        puts "404 caught"
      end
    end
  end
  task :update_twitter_sponsor_image => :environment do
    base_url = "https://twitter.com/"
    Sponsor.all.each_with_index do |sponsor, index|
      puts index
      url = base_url + sponsor.twitter_handle
      resp = Net::HTTP.get_response(URI.parse(url))
      unless resp.code == '404'
        doc = Nokogiri::HTML(resp.body)
        img = doc.xpath('//body/div/div/div/div/div/div/div/div/div/a/img/@src')
        sponsor.twitter_image_url = img.to_s.gsub('_400x400','')
        sponsor.save
      else
        puts '404 caught'
      end
    end
  end
end