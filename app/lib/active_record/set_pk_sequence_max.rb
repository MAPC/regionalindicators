class ActiveRecord::Base
  def self.set_pk_sequence_max(column=:id)
    get_sequence_sql = "SELECT pg_get_serial_sequence('#{table_name}', '#{column}')"
    
    result    = ActiveRecord::Base.connection.exec_query(get_sequence_sql)
    sequence  = result.rows.first.first

    set_max_sql = "SELECT setval('#{sequence}', (SELECT max(#{column}) FROM #{table_name}));"

    ActiveRecord::Base.connection.exec_query(set_max_sql).rows.first.first
  end
end