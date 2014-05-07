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
  has_one  :explanation, as: :explainable

  validates :title,    presence:    true, length: { maximum: 100, minimum: 8 }
  validates :subtitle, allow_blank: true, length: { maximum: 140, minimum: 8 }
  validate :featured_limit

  before_save :check_visible

  scope :featured,     where(featured: true)
  scope :visible,      where(visible:  true)

  scope :not_featured, where(visible: true).where(featured: false)
  scope :not_visible,  where(visible: false)

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

  private

    def check_visible
      self.visible = true if self.featured == true
    end

    def featured_limit
      if self.featured && self.class.featured.count >= 3
        errors.add(:base, "No more than 3 Topic Areas can be featured.")
      end
    end


end
