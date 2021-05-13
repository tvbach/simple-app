class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 250 }

  scope :order_micropost, -> { order(created_at: :desc) }
end
