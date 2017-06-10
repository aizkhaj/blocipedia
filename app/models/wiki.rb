class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  validates :user, presence: true

  default_scope { order('updated_at DESC') }
end
