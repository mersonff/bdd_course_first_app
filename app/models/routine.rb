class Routine < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :description

  default_scope { order(created_at: :desc) }
end
