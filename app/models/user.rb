class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin
  # attr_accessible :title, :body

  VALID_MAPC_EMAIL = /\A[\w+\-.]+@mapc\.org\z/i
  validates :email, presence: true, format: { with: VALID_MAPC_EMAIL }

  def admin?
    admin
  end

  rails_admin do
    list do
      field :id
      field :email
      field :admin
      field :sign_in_count
      field :last_sign_in_at
      field :reset_password_sent_at
    end
  end
  
end