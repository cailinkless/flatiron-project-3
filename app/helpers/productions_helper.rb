module ProductionsHelper

    def company_id_field(production)
        if production.company.nil?
            select_tag "production[company_id]", options_from_collection_for_select(Company.all, :id, :name), include_blank: true
        else
            hidden_field_tag "production[company_id]", production.company_id
        end
    end
end
