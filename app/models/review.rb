class Review < ApplicationRecord
  belongs_to :product




  validades :body, presence: true
end
