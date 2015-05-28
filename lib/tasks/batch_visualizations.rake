namespace :db do
  desc "Batch populate data visualizations"
  task viz: :environment do

    visualizations = [
      {
        d3_file_name:     'econ_context_total_employment.js',
        data_file_name:   'emp_by_year_comm_type.csv',
        title:            'Total Employment 2001-2012',
        explainable_type: 'Indicator',
        explainable_id:    294
      },
      {
        d3_file_name:     'econ_context_employment_change.js',
        data_file_name:   'employment_change_msa.csv',
        title:            'Employment Change In Metro Boston Firms, 2005-2012',
        explainable_type: 'Indicator',
        explainable_id:    294
      },
      {
        d3_file_name:     'econ_context_employment_by_industry.js',
        data_file_name:   'employment_change_by_industry_metroboston.csv',
        title:            'Employment in Metro Boston Firms by Industry, 2001-2012',
        explainable_type: 'Indicator',
        explainable_id:    [295,296,297,298,299,300,301,302,303,304]
      },
      {
        d3_file_name:     'econ_context_high_skill_jobs.js',
        data_file_name:   'employment_by_skill_level_msa.csv',
        title:            'High Skill Jobs as Percent of Total Employment, 2004-2012',
        explainable_type: 'Indicator',
        explainable_id:    317
      },
      {
        d3_file_name:     'econ_context_mid_skill_jobs.js',
        data_file_name:   'employment_by_skill_level_msa.csv',
        title:            'Mid Skill Jobs as Percent of Total Employment, 2004-2012',
        explainable_type: 'Indicator',
        explainable_id:    318
      },
      {
        d3_file_name:     'econ_context_low_skill_jobs.js',
        data_file_name:   'employment_by_skill_level_msa.csv',
        title:            'Low Skill Jobs as Percent of Total Employment, 2004-2012',
        explainable_type: 'Indicator',
        explainable_id:    319
      },
      {
        d3_file_name:     'EducatedWorkforce1_with_degree_by_type_mbc.js',
        data_file_name:   'edattain_by_race_puma.csv',
        title:            '% of Working Age Adults with at least a 2 to 4 year degree by Puma Community Type',
        explainable_type: 'Indicator',
        explainable_id:    123
      },
      {
        d3_file_name:     'EducatedWorkforce2_share_adults_with_degree_lc.js',
        data_file_name:   'edattain_by_msa.csv',
        title:            'Share of Adults Ages 25+ With a 2- or 4-Year Degree or Higher Among 25 Most Populous Metro Areas',
        explainable_type: 'Indicator',
        explainable_id:    123
      },
      {
        d3_file_name:     'EducatedWorkforce3_with_degree_by_race_type_mbc.js',
        data_file_name:   'edattain_by_race_puma.csv',
        title:            '% of Working Age Adults with at least a 2 to 4 year degree by Race and Puma Community Type',
        explainable_type: 'Indicator',
        explainable_id:    [211, 212, 213]
      },
      {
        d3_file_name:     'EducatedWorkforce4_with_degree_gap_by_race_mbc.js',
        data_file_name:   'edattain_gap_msa.csv',
        title:            'Bachelors Degree or Higher Attainment Gap. Adults of Color Compared to White Adults',
        explainable_type: 'Indicator',
        explainable_id:    [211, 212, 213]
      },
      {
        d3_file_name:     'EducatedWorkforce5_adults_without_HS_diploma_by_comm_type.js',
        data_file_name:   'edattain_by_race_puma.csv',
        title:            '% of Working Age Adults with No High School Diploma by Puma Community Type',
        explainable_type: 'Indicator',
        explainable_id:    214
      },
      {
        d3_file_name:     'EducatedWorkforce6_share_adults_without_HS_diploma_lc.js',
        data_file_name:   'edattain_by_msa.csv',
        title:            'Share of Adults Ages 25+ Without a High School Diploma Among 25 Most Populous Metro Areas',
        explainable_type: 'Indicator',
        explainable_id:    214
      },
      {
        d3_file_name:     'EducatedWorkforce7_without_HS_diploma_by_race_type_mbc.js',
        data_file_name:   'edattain_by_race_puma.csv',
        title:            '% Adults Less Than a High School Diploma by Race and Puma Community Type',
        explainable_type: 'Indicator',
        explainable_id:    [215, 216, 217]
      },
      {
        d3_file_name:     'EducatedWorkforce8_without_HS_diploma_gap_by_race_mbc.js',
        data_file_name:   'edattain_gap_msa.csv',
        title:            'No High School Diploma Attainment Gap. Adults of Color Compared to White Adults',
        explainable_type: 'Indicator',
        explainable_id:    [215, 216, 217]
      },
      {
        d3_file_name:     'EducatedWorkforce10_debt_to_degree_average_mbc_lc.js',
        data_file_name:   'debttodegree_average.csv',
        title:            'Debt to Degree Ratio by Sector',
        explainable_type: 'Indicator',
        explainable_id:    [218, 219]
      },
      {
        d3_file_name:     'EducatedWorkforce9_debt_to_degree_ratio_lc.js',
        data_file_name:   'debttodegree.csv',
        title:            'Debt to Degree Ratio by Year',
        explainable_type: 'Indicator',
        explainable_id:    [218, 219]
      }
    ]

    Visualization.destroy_all ; Visualization.reset_pk_sequence

    visualizations.each do |obj|
      ids = Array(obj[:explainable_id])
      
      ids.each do |id|
        indicator   = Indicator.find(id)
        explanation = indicator.explanation

        viz = explanation.visualizations.build

        viz.assign_attributes({d3_file_name:   obj[:d3_file_name],
                               data_file_name: obj[:data_file_name],
                               title:          obj[:title]})
        puts viz.inspect
        puts viz.errors.full_messages if !viz.valid?
        viz.save
        puts viz.inspect
      end
    end
    
  end
end