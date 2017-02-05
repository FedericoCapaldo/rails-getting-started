class Article < ApplicationRecord
  # relationship with the comments table
  # now there is an array in the object @article called @article.comments that retrives all the comments of this article
  has_many :comments

  # in the model you can add data validation before going into the database
  validates :title, presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
