require "csv"

CSV.foreach('seeds_csvs/entertainment.csv', :headers => true) do |csv_obj|
  Entertainmentoption.create(mediatype: csv_obj['mediatype'], name: csv_obj['name'], author: csv_obj['author'], artist: csv_obj['artist'], director: csv_obj['director'], description: csv_obj['description'], votes: csv_obj['votes'].to_i)
end








# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
