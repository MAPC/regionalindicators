# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Topic Areas

require 'csv'

def topic_areas
  CSV.foreach('db/fixtures/topic_areas.csv', headers: true) do |row|

    id       = row[0]
    abbr     = row[1]
    title    = row[2]
    subtitle = row[3]

    begin
      record = TopicArea.find(id)
    rescue ActiveRecord::RecordNotFound
      record = TopicArea.create(id: id, abbr: abbr, title: title, subtitle: subtitle)
    ensure
      puts record.inspect
    end
  end
end


# Goals

def goals

  # first loop
  CSV.foreach('db/fixtures/goals.csv', headers: true) do |row|

    puts row.inspect

    number        = row[0]
    id            = number
    title         = row[1]
    topic_area_id = row[2]

    begin
      goal = Goal.find(id)
    rescue ActiveRecord::RecordNotFound
      topic_area = TopicArea.find(topic_area_id)
      topic_area.goals.create(id: number, number: number, title: title)
    ensure
      puts goal.inspect
    end
  end

  CSV.foreach('db/fixtures/metrofuture.csv', headers: true) do |row|
    
    puts row.inspect

    id          = row[6].to_i
    description = row[5]

    next if id == nil
    next if id == 0

    goal = Goal.find(id)

    if goal.description.blank?
      goal.description = description
      goal.save
    end

    puts goal.inspect
  end
end


def objectives
  CSV.foreach('db/fixtures/metrofuture.csv', headers: true) do |row|
    
    goal_id = row[6]
    number  = row[7].to_s.gsub(/^\d+\./, '')
    title   = row[8].to_s

    next if (goal_id.nil? || goal_id.to_i == 0)

    goal      = Goal.find(goal_id)
    objective = goal.objectives.create(number: number, title: title)
    puts objective.inspect
  end
end


def issue_areas
  CSV.foreach('db/fixtures/issue_areas.csv', headers: true) do |row|

    title       = row[0]
    url         = row[1]
    icon        = row[2]

    issue_area = IssueArea.find_by_title(title)

    if issue_area.nil?
      issue_area = IssueArea.new(title: title, datacommon_url: url, icon: icon)
    end

    issue_area.save
    puts issue_area.errors.full_messages

  end
end


def indicators
  CSV.foreach('db/fixtures/metrofuture.csv', headers: true) do |row|

    id               = row[0]
    title            = row[9]
    objective_title  = row[8].to_s

    objective = Objective.find_by_title(objective_title)
    next if objective.nil?
    
    indicator = objective.indicators.create(id: id, number: id, title: title)
    puts indicator.inspect

  end
end


# topic_areas
# goals
# objectives
# issue_areas
indicators