class User < ApplicationRecord
    has_secure_password
    has_many :materials
    has_many :diys, through: :materials

    validates_presence_of :username, :name, :island_name, :email, :dream_address
    validates_uniqueness_of :username
end
