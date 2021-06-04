module MaterialsHelper

    def form_url_helper(diy)
        diy ? diy_materials_path(diy) : materials_path
    end
end
