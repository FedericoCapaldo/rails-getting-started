class Article < ApplicationRecord
  # in the model you can add data validation before going into the database

  validates :title, presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
