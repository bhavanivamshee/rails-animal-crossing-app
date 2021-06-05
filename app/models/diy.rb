class Diy < ApplicationRecord
    has_many :materials
    accepts_nested_attributes_for :materials
    has_many :users, through: :materials

    validates :name, presence: true, uniqueness: true
    scope(:name_search, ->(name) { self.where("name LIKE ?", name) })

    def self.get_data
        resp = RestClient::Request.execute(method: :get,
        url: "https://api.nookipedia.com/nh/recipes",
        headers:{
            'X-API-KEY': ENV['NOOK_KEY']
                })
        diy_data = JSON.parse(resp.body)
        diy_data.each do |diy|
            @params = { diy: 
            {
                name: diy["name"],
                url: diy["url"],
                image_url: diy["image_url"],
                recipes_to_unlock: diy["recipes_to_unlock"],
                materials_diy: diy["materials"],
                materials_attributes: diy["materials"]
                }
            }

            Diy.create!(@params[:diy])

        end
    end
end
