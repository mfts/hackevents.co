# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.where(name: "Finance",                  primary_color: 5789398).first_or_create   #5856D6
Category.where(name: "Science & Education",      primary_color: 31487).first_or_create     #007AFF
Category.where(name: "Technology",               primary_color: 3451612).first_or_create   #34AADC
Category.where(name: "Open data / source",       primary_color: 5949690).first_or_create   #5AC8FA
Category.where(name: "Travel & Transportation",  primary_color: 5036388).first_or_create   #4CD964
Category.where(name: "Fun & Entertainment",      primary_color: 16763904).first_or_create  #FFCC00
Category.where(name: "Health & Fitness",         primary_color: 16749824).first_or_create  #FF9500
Category.where(name: "Without Topic",            primary_color: 16726832).first_or_create  #FF3B30
Category.where(name: "Specific Interest",        primary_color: 16723285).first_or_create  #FF2D55
Category.where(name: "Unknown",                  primary_color: 9342611).first_or_create   #8E8E93



