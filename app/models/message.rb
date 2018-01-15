class Message < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :receiver, presence: true
end
