require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test "get new category form and create category" do
    get_new_category_path
    assert_difference "Category.count", 1 do
      post categoties_path, params:{category:{name:"dance"}}
    end
    follow_redirect
    assert_match "dance", response.body
    end
end
