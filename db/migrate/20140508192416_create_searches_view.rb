class CreateSearchesView < ActiveRecord::Migration
  def up
    execute("""
      CREATE VIEW searches AS

        SELECT
          goals.id AS searchable_id,
          'Goal' AS searchable_type,
          goals.title AS term
        FROM goals

        UNION

        SELECT
          goals.id AS searchable_id,
          'Goal' AS searchable_type,
          goals.description AS term
        FROM goals

        UNION

        SELECT
          indicators.id AS searchable_id,
          'Indicator' AS searchable_type,
          indicators.title AS term
        FROM indicators
    """.strip)

    execute ("CREATE INDEX index_goals_on_title ON goals USING gin(to_tsvector('english', title))")
    execute ("CREATE INDEX index_goals_on_description ON goals USING gin(to_tsvector('english', description))")
    execute ("CREATE INDEX index_indicators_on_title ON indicators USING gin(to_tsvector('english', title))")
  end

  def down
    execute("DROP VIEW searches")
  end
end
