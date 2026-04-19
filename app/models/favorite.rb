class Favorite < ApplicationRecord
  validates :resource, presence: true
  validates :person_id, uniqueness: { scope: :resource }
end
