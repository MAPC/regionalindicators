class IssueArea < ActiveRecord::Base
  attr_accessible :datacommon_url,
                  :title,
                  :sort_order

  has_and_belongs_to_many :indicators, uniq: true
  
  DATACOMMON_REGEX = /metrobostondatacommon.org/

  validates :title,          presence: true, length: { maximum: 35, minimum: 6 }
  validates :datacommon_url, presence: true, format: { with: DATACOMMON_REGEX }

  scope :ordered, where('sort_order IS NOT NULL').order('sort_order')

  include SlugExtension
  alias_method :css_class, :slug

  def has_indicators?
    !self.indicators.blank?
  end

  rails_admin do
    list do
      field :id
      field :title
      field :sort_order
    end
  end

end