class Group < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :budgets, dependent: :destroy

  has_one_attached :icon, dependent: :destroy

  validates :name, presence: true, length: { maximum: 150 }
  validates :icon, presence: true
end
