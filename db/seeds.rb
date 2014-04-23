# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


model_names = %w( TopicArea Goal Objective Indicator IssueArea StaticPage User )

model_names.each {|model_name| require "#{model_name.tableize}"}

model_names.each do |model_name|
  puts "seeding #{model_name}"
  model = Module.const_get model_name
  model.destroy_all
  model.reset_pk_sequence
  model.create( eval "Fixtures::#{model_name.tableize}" )
end