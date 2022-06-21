require "test_helper"

class BarbersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @barber = barbers(:one)
  end

  test "should get index" do
    get barbers_url, as: :json
    assert_response :success
  end

  test "should create barber" do
    assert_difference('Barber.count') do
      post barbers_url, params: { barber: { bio: @barber.bio, email: @barber.email, image_url: @barber.image_url, name: @barber.name } }, as: :json
    end

    assert_response 201
  end

  test "should show barber" do
    get barber_url(@barber), as: :json
    assert_response :success
  end

  test "should update barber" do
    patch barber_url(@barber), params: { barber: { bio: @barber.bio, email: @barber.email, image_url: @barber.image_url, name: @barber.name } }, as: :json
    assert_response 200
  end

  test "should destroy barber" do
    assert_difference('Barber.count', -1) do
      delete barber_url(@barber), as: :json
    end

    assert_response 204
  end
end
