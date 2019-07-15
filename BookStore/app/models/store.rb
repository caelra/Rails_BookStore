class Store < ApplicationRecord
  has_many   :relationships, dependent: :destroy
  has_many   :books, through: :relationships  
  belongs_to :user, touch: true

  validates :codename, presence: true, allow_nil: false
  validates :address, presence: true, allow_nil: false
  validates :phone, presence: true, length: { maximum: 10 }
end
