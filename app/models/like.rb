class Like < ApplicationRecord
  validates :user_id, :presence => true, :uniqueness => { :photo_id => true }
  validates :photo_id, :presence => true
  belongs_to :user
  belongs_to :photo
end
