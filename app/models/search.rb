class Search < ActiveRecord::Base
  extend Textacular

  attr_accessor :query
  attr_accessible :query

  belongs_to :searchable, polymorphic: true

  def results
    if @query.present?
      self.class.search(@query).preload(:searchable).map!(&:searchable).uniq
    else
      Search.none
    end
  end
end
