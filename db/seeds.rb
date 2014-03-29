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
  CSV.foreach('db/fixtures/export_goals.csv', headers: true) do |row|

    begin
      goal = Goal.find row['id']
    rescue ActiveRecord::RecordNotFound
      topic_area = TopicArea.find row['topic_area_id']
      goal = topic_area.goals.create( id:          row['id'],
                                      number:      row['number'],
                                      title:       row['title'],
                                      description: row['description'] )
    ensure
      puts goal.inspect
    end
  end
end


def objectives
  CSV.foreach('db/fixtures/metrofuture.csv', headers: true) do |row|

    number  = row['objective_number'].to_s.gsub(/^\d+\./, '')
    title   = row['objective_title'].to_s

    objective = Objective.find_by_title title 
    if objective.nil?
      goal      = Goal.find row['goal_number']
      objective = goal.objectives.create(number: number, title: title)
      puts objective.inspect
    end
  end
end


def issue_areas
  CSV.foreach('db/fixtures/issue_areas.csv', headers: true) do |row|

    title       = row[0]
    url         = row[1]
    icon        = row[2]
    sort_order  = row[3]

    issue_area = IssueArea.find_by_title(title)

    if issue_area.nil?
      issue_area = IssueArea.new(title: title, datacommon_url: url, icon: icon, sort_order: sort_order)
    end

    issue_area.save
    puts issue_area.errors.full_messages

  end
end


def indicators
  CSV.foreach('db/fixtures/metrofuture.csv', headers: true) do |row|

    id               = row['indicator_id']
    title            = row['indicator_title']
    objective_title  = row['objective_title'].to_s

    objective = Objective.find_by_title objective_title
    
    indicator = objective.indicators.create(id: id,
                                            number: id,
                                            title: title || "input title",
                                            units: "placeholder")
    puts indicator.inspect

  end
end


def reports

  count = 1

  CSV.foreach('db/fixtures/sample_reports.csv', headers: true) do |row|
    # puts row.inspect

    # Indicator
    ind_id = count

    # Snapshot
    date  = row[7]
    rank  = row[8]
    value = row[9]

    # Topic Area
    ta_id        = row[0]
    ta_narrative = row[1]

    # Subject 
    subj_title     = row[2]
    subj_narrative = row[3]

    # Indicator Explanation
    exp_narrative = row[5]

    # Source
    src_author = row[11]
    src_date   = row[13]
    src_title  = row[14]
    src_url    = row[15]
    
    

    topic_area = TopicArea.find(ta_id)

    subject = Subject.find_by_title(subj_title)

    if subject.nil?
      subject = topic_area.subjects.create(title: subj_title)
    end
    puts subject.inspect

    subj_explanation = subject.create_explanation(narrative: subj_narrative)
    puts subj_explanation.inspect

    indicator   = Indicator.find(ind_id)
    snapshot    = indicator.snapshots.create(value: value, date: date, rank: rank)
    puts indicator.snapshots
    
    subject.indicators << indicator
    puts subject.indicators


    explanation = indicator.create_explanation(narrative: exp_narrative)
    puts explanation.inspect

    # source = Source.find_by_title(src_title)
    # if source.nil?
    source      = explanation.sources.create(title:  src_title, 
                                             url:    src_url, 
                                             author: src_author, 
                                             date:   DateTime.new(src_date.to_i))
    # end
    puts source.inspect

    count += 1

  end
end



topic_areas
# goals
# objectives
# indicators
# issue_areas
# reports

