class Objective < ActiveRecord::Base
  attr_accessible :title, :number
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

end
