namespace :db do
  desc "Drop all the explanations, sources, subjects, and snapshots"
  task empty: :environment do

    model_names = %w( Explanation Source Subject Snapshot )

    model_names.each do |model_name|
      puts "emptying #{model_name}"
      model = Module.const_get model_name
      model.destroy_all
      model.reset_pk_sequence
    end
    
  end
end