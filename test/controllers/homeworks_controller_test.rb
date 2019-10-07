require 'test_helper'

class HomeworksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homework = homeworks(:one)
  end

  test "should get index" do
    get homeworks_url
    assert_response :success
  end

  test "should get new" do
    get new_homework_url
    assert_response :success
  end

  test "should create homework" do
    assert_difference('Homework.count') do
      post homeworks_url, params: { homework: { category: @homework.category, category_id: @homework.category_id, deadline: @homework.deadline, description: @homework.description, homework_name: @homework.homework_name } }
    end

    assert_redirected_to homework_url(Homework.last)
  end

  test "should show homework" do
    get homework_url(@homework)
    assert_response :success
  end

  test "should get edit" do
    get edit_homework_url(@homework)
    assert_response :success
  end

  test "should update homework" do
    patch homework_url(@homework), params: { homework: { category: @homework.category, category_id: @homework.category_id, deadline: @homework.deadline, description: @homework.description, homework_name: @homework.homework_name } }
    assert_redirected_to homework_url(@homework)
  end

  test "should destroy homework" do
    assert_difference('Homework.count', -1) do
      delete homework_url(@homework)
    end

    assert_redirected_to homeworks_url
  end
end
