namespace :db do
  desc "Fill database with report data from spreadsheets"
  task populate: :environment do

    @spreadsheet = Roo::Excelx.new("#{Rails.root}/db/fixtures/xlsx/prosperity_indicators_spreadsheet.xlsx")
    sheets      = %w( indicators-subjects snapshots subjects sources )

    
=begin


TODO: 


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

    @prosperity = TopicArea.find 1

    def subjects

      @spreadsheet.default_sheet = 'subjects'
      count = 0
      
      @spreadsheet.each(headers: true) do |s|
        count += 1
        next if count == @spreadsheet.first_row

        subject = Subject.find_by_title(s['subject_title']) || @prosperity.subjects.create(title: s['subject_title'])

        explain = subject.explanation || subject.build_explanation
        explain.assign_attributes({narrative: s['narrative']})
        puts explain.errors.full_messages if !explain.valid?
        explain.save

        puts "created Subject #{subject.title} (#{subject.id})"
        puts "\t with explanation \"#{explain.narrative[0..40]}\" (#{explain.id})"
      end
    end


    # Indicators

    def indicators

      @spreadsheet.default_sheet = 'indicators-subjects'
      count = 0

      @spreadsheet.each(headers: true) do |i|
        count += 1
        next if count == @spreadsheet.first_row

        indicator = Indicator.find i['id'].to_i
        indicator.subject ||= Subject.find_by_title(i['subject_title'])
        indicator.assign_attributes({ threshhold:             i['threshhold'],
                                      higher_value_is_better: i['higher_value_is_better'],
                                      lower_rank_is_better:   i['lower_rank_is_better']    }, without_protection: true)
        indicator.save

        if i['group']
          puts i['group'].inspect
          group = IndicatorGroup.find_by_title(i['group']) || IndicatorGroup.create(title: i['group'])
          group.indicators << indicator
        end

        # Assign issue areas

        issue_area_titles = i['issue_area_title'].split(', ')

        issue_area_titles.each do |title|
          indicator.issue_areas << IssueArea.find_by_title(title)
        end

        # Assign explanation#narrative
        explanation = indicator.explanation || indicator.build_explanation
        explanation.assign_attributes({ narrative: i['narrative']})
        explanation.save

        puts "saved Indicator #{indicator.id}"
        puts "\t with explanation \"#{explanation.narrative[0..40]}\" (#{explanation.id})"
        puts "\t with threshhold #{ indicator.threshhold }"
      end
    end

    # Snapshots

    def snapshots
      Snapshot.destroy_all
      Snapshot.reset_pk_sequence

      @spreadsheet.default_sheet = 'snapshots'
      count = 0

      @spreadsheet.each(headers: true) do |s|
        count += 1
        next if count == @spreadsheet.first_row

        indicator = Indicator.find(s['indicator_id'].to_i)
        indicator.update_attribute(:units, s['unit'])

        date  = DateTime.parse("Jan #{s['year'].to_i.to_s}")
        value = s['value'].to_f
        rank  = s['rank'].to_i

        indicator.snapshots.create( date:  date,
                                    value: value,
                                    rank:  rank   )
      end
    end

    # Sources

    def sources
      Source.destroy_all
      Source.reset_pk_sequence

      @spreadsheet.default_sheet = 'sources'
      count = 0

      @spreadsheet.each(headers: true) do |s|
        count += 1
        next if count == @spreadsheet.first_row

        indicator_ids = (s['indicator_id'].to_s.split(', '))
        date   = DateTime.parse(s['date']) if s['date']
        source = Source.create( date:    date,
                                title:   s['title'],
                                author:  s['author'],
                                url:     s['url'],
                                comment: s['comment'])
        Indicator.find(indicator_ids).each do |i|
          i.explanation.sources << source
          puts "added #{source.id} to #{i.title} (#{i.id})"
        end
      end

    end

    subjects
    indicators
    snapshots
    sources


  end
end
