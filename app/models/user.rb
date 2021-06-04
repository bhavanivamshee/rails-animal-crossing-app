class User < ApplicationRecord
    has_secure_password
    has_many :materials
    has_many :diys, through: :materials
end
