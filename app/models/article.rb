class Article < ApplicationRecord
  # relationship with the comments table
  # now there is an array in the object @article called @article.comments that retrives all the comments of this article

  # If you delete an article, its associated comments will also need to be deleted,
  # otherwise they would simply occupy space in the database. Rails allows you to use
  # the dependent option of an association to achieve this.
  has_many :comments, dependent: :destroy

  # in the model you can add data validation before going into the database
  validates :title, presence: true,
                    length: {minimum: 5},
                    uniqueness: true
end
