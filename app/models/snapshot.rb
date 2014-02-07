class Snapshot < ActiveRecord::Base
  attr_accessible :date, :rank, :value,
                  :indicator_id
  
  belongs_to :indicator

  validates :value, presence: true
  validates_datetime :date

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

end