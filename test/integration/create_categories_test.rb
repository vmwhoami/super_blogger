require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get_new_category_path
    assert_difference "Category.count", 1 do
      post_via_redirect categories_path
    end
  end
end
