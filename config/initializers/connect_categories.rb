# Load categories for the /connect/categories endpoint and store it in a
# constant so we only load the file once instead of every request.
CONNECT_CATEGORIES = Rails.application.config_for(:connect_categories).freeze

CONNECT_CATEGORIES_LAST_MODIFIED = Time.zone.now