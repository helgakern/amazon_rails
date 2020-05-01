class Like < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates(
    :user_id,
    uniqueness: {
      scope: :review_id,
      message: "Can't like a review more than once"
    }
  )
end
