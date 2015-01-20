module BasicFilters
  extend ActiveSupport::Concern

  class << self
    private

    def select_params
      params.permit(:fields)
    end

    def sort_params
      params.permit(:sort)
    end

    def limit_params
      params.permit(:limit)
    end
  end
end
