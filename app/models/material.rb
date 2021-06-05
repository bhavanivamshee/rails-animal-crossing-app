class Material < ApplicationRecord
  belongs_to :diy
  belongs_to :user, optional: true
  validates_presence_of :name, :count
  before_validation :make_title_case

  scope(:name_search, ->(name) { self.where("name like ?", name) })

  def is_title_case
    if self.name != self.name.titlecase
        self.errors.add(:name, "must be tilecase")
    end
  end

  def make_title_case
    self.name = self.name.titlecase
  end

end
