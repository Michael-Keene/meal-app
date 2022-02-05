require "test_helper"

class SearchEntryControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_entry_index_url
    assert_response :success
  end
end
