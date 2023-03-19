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

  test "show" do
    get "/contacts/#{Contact.first.id}.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["name", "email", "phone_number", "created_at", "updated_at"], data.keys
  end

  test "update" do
    contact = Contact.first
    patch "/contacts/#{contact.id}.json", params: { name: "Updated name" }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated name", data["name"]
  end
end
