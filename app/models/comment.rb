class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  scope :persisted, -> { where "id IS NOT NULL" }
end
