class Product < ApplicationRecord

 belongs_to :user


validates :product_name, presence: true  , format: { with: /[a-zA-Z]/}
validates :price, presence: true, numericality: {:greater_than => 0}   
validates :quantity, presence: true ,  numericality: {:greater_than => 0}  


end
