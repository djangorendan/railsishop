require "application_system_test_case"

class ComparesTest < ApplicationSystemTestCase
  setup do
    @compare = compares(:one)
  end

  test "visiting the index" do
    visit compares_url
    assert_selector "h1", text: "Compares"
  end

  test "creating a Compare" do
    visit compares_url
    click_on "New Compare"

    click_on "Create Compare"

    assert_text "Compare was successfully created"
    click_on "Back"
  end

  test "updating a Compare" do
    visit compares_url
    click_on "Edit", match: :first

    click_on "Update Compare"

    assert_text "Compare was successfully updated"
    click_on "Back"
  end

  test "destroying a Compare" do
    visit compares_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Compare was successfully destroyed"
  end
end
