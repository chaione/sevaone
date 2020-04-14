require 'test_helper'

class UnresolvedMarkersControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  fixtures :all

  test "only admins can access index" do
    get connect_unresolved_markers_path
    assert_redirected_to root_path
    sign_in users(:admin)
    get connect_unresolved_markers_path
    assert_response :success
  end

  test "only admins can access show" do
    get connect_unresolved_marker_path(connect_markers(:need))
    assert_redirected_to root_path
    sign_in users(:admin)
    get connect_unresolved_marker_path(connect_markers(:need))
    assert_response :success
  end

  test "Can resolve a marker" do
    sign_in users(:admin)
    marker = connect_markers(:need)
    refute(marker.resolved?)
    patch connect_unresolved_marker_path(marker)
    assert_redirected_to connect_unresolved_markers_path
    marker.reload
    assert(marker.resolved?)
  end
end
