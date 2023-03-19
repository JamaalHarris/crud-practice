require "test_helper"

class ContactsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "index" do
    get "/contacts.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Contact.count, data.length
  end
end
