namespace :db do
  desc "Batch populate data visualizations"
  task viz: :environment do

    visualizations = [
      # {
      #   d3_file_name:     'diverse_productive_workforce_annual_laborforce_trends.js',
      #   data_file_name:   'bls_laborforce_employment_msa_d3.csv',
      #   title:            'Annual Labor Force Trends 1990-2013',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_annual_unemployment_rate.js',
      #   data_file_name:   'bls_laborforce_employment_msa_d3.csv',
      #   title:            'Annual Unemployment Rate 1990-2013',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_civilian_unemployment_gap_by_race.js',
      #   data_file_name:   'unemp_gap_msa.csv',
      #   title:            'Civilian Unemployment Gap by Race, Ages 16-64 National Comparison',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_laborforce_participation_gap_by_race.js',
      #   data_file_name:   'lf_gap_msa.csv',
      #   title:            'Labor Force Participation Gap by Race, Ages 16-64 National Comparison',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_by_population_25_to_64.js',
      #   data_file_name:   'labor_force_participation_msa.csv',
      #   title:            'Labor Force Participation, Population 25 to 64',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_by_skill_level_college_or_higher.js',
      #   data_file_name:   'labor_force_participation_by_education_msa.csv',
      #   title:            'Labor Force by Skill Level D. College or higher',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_by_skill_level_highschool.js',
      #   data_file_name:   'labor_force_participation_by_education_msa.csv',
      #   title:            '% In labor force with only a high school diploma',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_by_skill_level_less_than_highschool.js',
      #   data_file_name:   'labor_force_participation_by_education_msa.csv',
      #   title:            'Labor Force by Skill Level A. Less Than High School',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_by_skill_level_some_college.js',
      #   data_file_name:   'labor_force_participation_by_education_msa.csv',
      #   title:            'Labor Force by Skill Level C. Some College',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_labor_force_participation_ages_25_64.js',
      #   data_file_name:   'laborforce_edattain_by_race_puma.csv',
      #   title:            'Labor Force Participation, Ages 25-64 by Race and Puma Community Type',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_metro_boston_domestic_migration_flows.js',
      #   data_file_name:   'domestic_migration_flows_metroboston.csv',
      #   title:            'Metro Boston Domestic Migration Flows, 2005-12',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_unemployment_rate.js',
      #   data_file_name:   'unemployment_ages_25_64_by_edattain.csv',
      #   title:            'Regional Unemployment Rate, Ages 25-64 by Race and educational attainment',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_unemp_underutilization_rates.js',
      #   data_file_name:   'unemp_alt_measures_states.csv',
      #   title:            'MA State Unemployment and Underutilization Rates',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      # {
      #   d3_file_name:     'diverse_productive_workforce_youth_laborforce_participation_rate.js',
      #   data_file_name:   'youth_laborforce_by_race.csv',
      #   title:            'Youth Labor Force Participation Rate, Ages 16-24 by Race and Puma Community Type',
      #   explainable_type: 'Indicator',
      #   explainable_id:    
      # },
      {
        d3_file_name:     'EducatedWorkforce10_debt_to_degree_average_mbc_lc.js',
        data_file_name:   'debttodegree_average.csv',
        title:            'Debt to Degree Ratio by Sector',
        explainable_type: 'Indicator',
        explainable_id:    218
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
        d3_file_name:     'EducatedWorkforce9_debt_to_degree_ratio_lc.js',
        data_file_name:   'debttodegree.csv',
        title:            'Debt to Degree Ratio by Year',
        explainable_type: 'Indicator',
        explainable_id:    218
      }
    ]

   # Visualization.destroy_all ; Visualization.reset_pk_sequence

    visualizations.each do |obj|
      ids = Array(obj[:explainable_id])
      
      ids.each do |id|
        indicator   = Indicator.find(id)
        explanation = indicator.explanation

        viz = explanation.visualization || explanation.build_visualization
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