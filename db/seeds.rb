# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Helps print on a single line

def print_and_flush(str)
  print str
  $stdout.flush
end


model_names = %w( Goal
                  Indicator
                  IssueArea
                  Objective
                  StaticPage
                  TopicArea
                  User       )

model_names.each {|model_name| require "#{model_name.tableize}"}

model_names.each do |model_name|
  print_and_flush "seeding #{model_name}"

  model   = Module.const_get model_name
  records = Fixtures.send "#{model.table_name}"

  records.each do |record|
    model.create_or_update(record, without_protection: true)
  end

  puts " -- DONE!"
end


