class Chat < ApplicationRecord
  validates :message, length: {maximum: 40 }

  belongs_to :user
  belongs_to :room
end
