require 'csv'

namespace :db do
  desc "Fill database with report data from spreadsheets"
  task populate: :environment do

    indicators_subjects = File.new(Rails.root + 'db/fixtures/csv/indicators-subjects.csv')
    snapshots           = File.new(Rails.root + 'db/fixtures/csv/snapshots.csv')
    subjects            = File.new(Rails.root + 'db/fixtures/csv/subjects.csv')
    sources             = File.new(Rails.root + 'db/fixtures/csv/sources.csv')
    
    
=begin
    SUBJECTS
      1.  Loop through subjects, creating them and their narratives.

    INDICATORS
      1.  Get the indicator by id or create it from available information,
          assign subject, issue areas, and objective,
          create narrative,
          and use a placeholder of 'UTBD' for units.
      2.  Loop through snapshots, creating them:
            convert values to float,
            take the last year of date ranges and make a date of it,
          assigning indicator units from snapshots#unit,
    SOURCES
      1.  Create source
        b.  Ensure an 'http*' prepends every URL. Use the grandvizauto before_validate
            for this helper.
      2.  Indicator.find_by(sources#indicator_id) and assign source to all of
          their respective narratives.

          No explanation? This should throw an error.

=end

    # Subjects

    prosperity = TopicArea.find 4

    CSV.foreach(subjects, headers: true) do |s|
      subject = prosperity.subjects.create(title: s['subject_title'])
      explain = subject.create_explanation(narrative: s['subject_narrative'])
      puts "created subject #{subject.title} (#{subject.id}) with explanation #{explain.id}"
    end


    # Indicators

    CSV.foreach(indicators_subjects, headers: true) do |i|

      indicator = Indicator.find i['id']
      indicator.subject ||= Subject.find_by_title(i['subject_title'])
      indicator.save

      # Assign issue areas
      i['issue_area_title'].split(', ').each {|t| indicator.issue_areas << IssueArea.find_by_title(t) }

      # Create explanation / revise narrative
      exp = indicator.create_explanation(narrative: i['narrative'])
      puts i['narrative'].length
      # puts "\t created or revised #{indicator.id} with narrative #{exp.narrative[0..20]}"
      puts exp.errors.full_messages
    end

    # Snapshots

    CSV.foreach(snapshots, headers: true) do |s|
      date = DateTime.parse("Jan #{s['year'][-4..-1]}")

      indicator = Indicator.find(s['indicator_id'])
      indicator.update_attribute(:units, s['unit'])
      indicator.snapshots.create( date:  date,
                                  value: s['value'].to_f,
                                  rank:  s['rank'].to_i  )
    end

    # Sources

    CSV.foreach(sources, headers: true) do |s|
      indicator_ids = (s['indicator_id'].to_s.split(', '))
      date = DateTime.parse(s['date']) if s['date']
      s = Source.create( date:    date,
                         title:   s['title'],
                         author:  s['author'],
                         url:     s['url'],
                         comment: s['comment'])
      Indicator.find(indicator_ids).each { |i| i.explanation.sources << s ; i.save ; puts "added #{s.id} to #{i.title} (#{i.id})" }
    end


  end
end
