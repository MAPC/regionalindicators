class Snapshot < ActiveRecord::Base
  attr_accessible :date,
                  :rank,
                  :value,
                  :indicator_id
  
  belongs_to :indicator

  validates :value, presence: true
  validates_datetime :date

  default_scope { order('date DESC') }

  def self.in_year(year)
    date = DateTime.new(year.to_i)
    self.where('date BETWEEN ? AND ?', date.beginning_of_year, date.end_of_year)
  end

  after_save :update_indicator

  rails_admin do
    list do
      field :id
      field :value
      field :rank
      field :date do
        pretty_value do
          value.strftime("%-d %b %Y")
        end
      end
      field :indicator_id do
        label "For Indicator"
      end
      field :indicator
    end
  end

  private

    def update_indicator
      self.indicator.update_value_delta
      self.indicator.update_rank_delta
    end

end