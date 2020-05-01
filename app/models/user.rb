class User < ApplicationRecord

  has_secure_password

  has_many :products
  has_many :reviews

  has_many :likes # association methods just add extra methods to instances of this class that help query records
  has_many :liked_reviews, through: :likes, source: :review # user is going to have many reviews, we're going to call the association liked_reviews, and active record needs to query the liked_reviews through this table called likes

  scope(:created_after, -> (date) { where("created_at < ?", "#{date}") })
  scope(:search, -> (query) { where("first_name ILIKE ? OR last_name ILIKE ? OR email ILIKE ?", "%#{query}%", "%#{query}%", "%#{query}%") })

  def full_name
    "#{first_name} #{last_name}".strip.capitalize!
  end
end

# Generated this model using `rails g model user first_name:string last_name:string email:string`
