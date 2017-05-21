class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wiki
  after_initialize :set_default_role

  enum role: [:basic, :premium, :admin]

  private
  def set_default_role
    self.role ||= :basic
  end
end
