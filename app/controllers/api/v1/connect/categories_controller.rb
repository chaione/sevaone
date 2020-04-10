# frozen_string_literal: true

module Api
  module V1
    module Connect
      class CategoriesController < ApplicationController
        def index
          if stale?(etag: CONNECT_CATEGORIES, last_modified: CONNECT_CATEGORIES_LAST_MODIFIED, public: true)
            render json: CONNECT_CATEGORIES
          end
        end
      end
    end
  end
end
