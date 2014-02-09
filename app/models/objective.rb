class Objective < ActiveRecord::Base
  attr_accessible :title, :number,
                  :goal_id, :indicator_ids

  belongs_to :goal
  has_many :indicators

  validates :title, presence: true, length: { maximum: 255, minimum: 8 }
  validates :number, presence: true

  def full_number
    return "#{self.goal.number}.#{self.number}" if self.goal?
    self.id.to_s
  end

  def goal?
    !self.goal.nil?
  end


  rails_admin do
    list do
      field :id
      field :full_number
      field :title
      field :goal_id do
        label "Goal ID"
      end
      field :goal
    end
  end

end
