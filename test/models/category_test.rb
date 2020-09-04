
require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name:"dance")
  end

 
  test "Category should be valid" do
    assert @category.valid?
  end
  
  test "Name should be present" do
    @category.name = ' '
    assert_not @category.valid? 
  end

  test "The name should not be more than 20 char long" do
    @category.name = 'b'*21
    assert_not @category.valid?
  end

  test "The name should not be shorter than 3" do
    @category.name = 'b'*2
    assert_not @category.valid?
  end

  
  test "Check for uniqueness" do
    @category.save
    dance = Category.new(name:'dance')
    assert_not dance.valid?
  end
end