class Relationship < ApplicationRecord
  belongs_to :store
  belongs_to :book
end
