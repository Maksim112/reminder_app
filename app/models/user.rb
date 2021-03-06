class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  belongs_to :plan
  has_many :events

  validates :plan, presence: true

#@!group Callbacks
  before_validation do
  	self.plan ||=Plan.find_by_name(:free)
  end

  def over_limit?
    self.plan.limit.to_i > 0 && self.sms_usage >+ self.plan.limit
  end
end