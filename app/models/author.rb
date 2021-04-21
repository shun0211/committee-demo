class Author < ApplicationRecord
  has_many :publishings
  has_many :books, through: :publishings
end
