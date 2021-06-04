class Material < ApplicationRecord
  belongs_to :diy
  belongs_to :user, optional: true
  validates_presence_of :name, :count

  scope(:name_search, ->(name) { self.where("name LIKE ?", name) })

end
