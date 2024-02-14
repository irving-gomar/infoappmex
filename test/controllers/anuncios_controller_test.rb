require "test_helper"

class AnunciosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get anuncios_index_url
    assert_response :success
  end
end
