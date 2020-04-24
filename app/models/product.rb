class Product < ApplicationRecord
    before_validation :set_defaults
    before_save :capitalize_title

    has_many(:reviews, dependent: :destroy)

    validates :title, {
        presence: true, 
        uniqueness: { case_sensitive: false}
    }

    validates :price, {
        numericality: { greater_than_or_equal_to: 0}
    }
    
    validates :description, {
        presence: true, 
        length: { minimum: 10}
    }

    private 

    def set_defaults
        self.price ||= 1
    end

    def capitalize_title 
        self.title = self.title.capitalize 
    end
end
