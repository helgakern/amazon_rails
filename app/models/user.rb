class User < ApplicationRecord

  has_secure_password

  has_many :products, dependent: :nullify
  has_many :reviews, dependent: :nullify
  has_many :likes, dependent: :destroy
  has_many :liked_reviews, through: :likes, source: :review
  has_many :favourites, dependent: :destroy
  has_many :favourited_products, through: :favourites, source: :product

  scope(:created_after, -> (date) { where("created_at < ?", "#{date}") })
  scope(:search, -> (query) { where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") })

  def full_name
    "#{first_name} #{last_name}".strip.capitalize!
  end
end

# Generated this model using `rails g model user first_name:string last_name:string email:string`