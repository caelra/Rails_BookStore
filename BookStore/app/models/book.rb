class Book < ApplicationRecord
  has_many   :relationships, dependent: :destroy
  has_many   :stores, through: :relationships
  belongs_to :user, touch: true
  
  validates :title, presence: true, allow_nil: false
  validates :author, presence: true, allow_nil: false
  validates :year, presence: true, allow_nil: false
end
