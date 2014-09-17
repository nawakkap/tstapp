class Product < ActiveRecord::Base
    has_one :inventory
end
