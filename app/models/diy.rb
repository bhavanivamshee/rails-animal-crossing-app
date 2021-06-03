class Diy < ApplicationRecord
    has_many :materials
    accepts_nested_attributes_for :materials
end
