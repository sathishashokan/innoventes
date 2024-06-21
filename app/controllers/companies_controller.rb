class CompaniesController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        company = Company.new(
            {
                company_name: params[:company_name], 
                company_code: params[:company_code], 
                email_id: params[:email_id], 
                strength: params[:strength], 
                web_site: params[:web_site]
            }
        )

        if company.save
            render(json: {company: company}, status: 200)
        else
            render(json: {error: "Please provide valid data"}, status: 422)
        end
    end

    def show
        if params[:id].present?
           company = Company.find(params[:id])
        else
            pagy, company = pagy((Company.all), page: params[:page], items: 1)
        end
        
        render(json:{ company: company }, status: 200)
    end

    def update
        if params[:id].present?
            company = Company.find(params[:id])
        else
            render(json: {error: "Please provide company id"}, status: 422)
        end
        company_name = params[:company_name].present? ? params[:company_name] : company.company_name 
        company_code = params[:company_code].present? ? params[:company_code] : company.company_code 
        email_id = params[:email_id].present? ? params[:email_id] : company.email_id 
        strength = params[:strength].present? ? params[:strength] : company.strength 
        web_site = params[:web_site].present? ? params[:web_site] : company.web_site
        company.update(
            company_name: company_name, 
            company_code: company_code, 
            email_id: email_id, 
            strength: strength, 
            web_site: web_site
        )
        render(json:{ company: company }, status: 200)
    end

    def destroy
        if params[:id].present?
            company = Company.find(params[:id])
            if company.destroy
                render(json:{ company: company }, status: 200)
            end
        else
            render(json:{ error: "Please provide company id" }, status: 422)
        end
    end
end
