class Comment < ApplicationRecord
  scope :persisted, -> { where "id IS NOT NULL" }

  belongs_to :article
  belongs_to :user
  has_many :comment

  def likes_count
    likes || 0
  end
end
