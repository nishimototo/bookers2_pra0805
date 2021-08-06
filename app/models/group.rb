class Group < ApplicationRecord
  attachment :image

  validates :name, presence: true
  validates :introduction, presence: true


  has_many :group_users, dependent: :destroy
  has_many :users, through: :group_users
end
