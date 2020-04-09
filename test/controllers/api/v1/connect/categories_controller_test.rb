require 'test_helper'

class Api::V1::Connect::CategoriesControllerTest < ActionDispatch::IntegrationTest

  test "returns all categories" do
    get api_v1_connect_categories_path
    json = JSON.parse(response.body)
    categories = Rails.application.config_for(:connect_categories)
    assert_equal json, categories
  end

  test "Respects If-Modified-Since headers" do
    get api_v1_connect_categories_path, headers: {
      "If-Modified-Since" => Time.now.rfc2822
    }
    assert_response 304

    get api_v1_connect_categories_path, headers: {
      "If-Modified-Since" => 2.days.ago.rfc2822
    }
    assert_response 200
  end

  test "Respects If-None-Match headers" do
    get api_v1_connect_categories_path, headers: {
      "If-None-Match" => 'nope'
    }
    etag = response.headers["ETag"]
    assert_not_nil etag, "Should have returned an etag"
    assert_response 200

    get api_v1_connect_categories_path, headers: {
      "If-None-Match" => etag
    }
    assert_response 304
  end
end
