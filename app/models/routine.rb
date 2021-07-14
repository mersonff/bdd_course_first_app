class Routine < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :description

  default_scope { order(created_at: :desc) }
end
