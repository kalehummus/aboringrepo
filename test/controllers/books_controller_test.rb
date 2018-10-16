require 'test_helper'

class BooksControllerTest < ActionDispatch::IntegrationTest
  test "should get searchbook" do
    get books_searchbook_url
    assert_response :success
  end

end
