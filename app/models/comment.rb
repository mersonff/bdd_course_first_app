class Comment < ApplicationRecord
  belongs_to :routine
  belongs_to :user

  validates_presence_of :body
end
