class Product < ApplicationRecord
    before_validation(:set_default_price)
    before_save(:capitalize_title)
    
    has_many(:reviews, dependant: :destroy)

    validates(:title, presence: true, uniqueness: {case_sensitive: false})
    validates(
        :description,
        presence: { message: "must exist" },
        length: { minimum: 10 }
    )
    validates(
        :price,
        numericality: { greater_than_or_equal_to: 0, allow_blank: true }
    )


    private 

    def set_default_price
        self.price ||= 1
    end

    def capitalize_title
        self.title = self.title.capitalize
    end

end


# Commands Lab 1:
# To create a product:
#  Product.create({ title: 'Shirt', description: 'Black t-shirt', price: 90 })
# To update:
# q = Product.find 1
# q.title = "t-shirt"
# q.save
# To check the update:
# Product.find(1)
# To delete the product:
# q.delete
# To check if the product was deleted:
# # Product.find(1)

# Lab 2:
# rails g migration change_type_of_price_to_float
# Inside the migration file:
#     update_column :products, :price, :float
# 



