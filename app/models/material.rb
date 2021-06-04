class Material < ApplicationRecord
  belongs_to :diy
  belongs_to :user, optional: true
  validates_presence_of :name, :count
end
