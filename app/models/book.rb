class Book < ApplicationRecord
  belongs_to :publisher
  has_many :publishings
  has_many :authors, through: :publishings
end
