class TopicArea < ActiveRecord::Base
  attr_accessible :abbr,
                  :title,
                  :subtitle,
                  :visible,
                  :featured,
                  :goal_ids,
                  :subject_ids
  has_many :goals
  has_many :subjects
  has_one :explanation, as: :explainable

  validates :title, presence: true, length: { maximum: 100, minimum: 8 }
  validates :subtitle, allow_blank: true, length: { maximum: 140, minimum: 8 }

  include SlugExtension

  def visible?
    self.visible
  end

  def featured?
    self.featured
  end

  rails_admin do
    list do
      field :id
      field :title
      field :subtitle
      field :visible
      field :featured
    end
  end

end
