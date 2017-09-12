class Api::V1::CharitableOrganizationsController < ApplicationController

  before_action do
    request.format = :json
  end

  def index
    @filters = {}
    # get all charitable_organizations into a nice array
    # find all Amazon products we have
    @charitable_organizations = CharitableOrganization.all

      if params[:services].present?
        @filters[:services] = params[:services]
        @charitable_organizations = @charitable_organizations.where("services ILIKE ?", "%#{params[:services]}%")
      end

      if params[:name].present?
        @filters[:name] = params[:name]
        @charitable_organizations = @charitable_organizations.where("name ILIKE ?", "%#{params[:name]}%")
      end

      if params[:food_bank].present?
        @filters[:food_bank] = params[:food_bank]
        @charitable_organizations = @charitable_organizations.where(food_bank: true)
      end

      if params[:city].present?
        @filters[:city] = params[:city]
        @charitable_organizations = @charitable_organizations.where("city ILIKE ?", "%#{params[:city]}%")
      end

      if stale?(etag: @charitable_organizations, last_modified: @charitable_organizations.maximum(:updated_at), public: true)

        # here because limit is causing a SQL problem:  column "distance" does not exist
        if params[:limit].to_i > 0
          @filters[:limit] = params[:limit].to_i
          @charitable_organizations = @charitable_organizations.take(params[:limit].to_i)
        end

      end

  end
end
