# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.create(name: "Finance",                  primary_color: 5789398)   #5856D6
Category.create(name: "Science & Education",      primary_color: 31487)     #007AFF
Category.create(name: "Technology",               primary_color: 3451612)   #34AADC
Category.create(name: "Open data / source",       primary_color: 5949690)   #5AC8FA
Category.create(name: "Travel & Transportation",  primary_color: 5036388)   #4CD964
Category.create(name: "Fun & Entertainment",      primary_color: 16763904)  #FFCC00
Category.create(name: "Health & Fitness",         primary_color: 16749824)  #FF9500
Category.create(name: "Without Topic",            primary_color: 16726832)  #FF3B30
Category.create(name: "Specific Interest",        primary_color: 16723285)  #FF2D55
Category.create(name: "Unknown",                  primary_color: 9342611)   #8E8E93

