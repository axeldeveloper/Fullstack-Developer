# frozen_string_literal: true
require "rails_helper"

#RSpec.describe "Sign up", type: :system, js: true do
RSpec.describe "Sign up page", type: :system do
  #before(:each) do
  #  driven_by :selenium, using: :chrome
  #end

  # Test if a user can sign up successfully
  it "allows a user to sign up" do
    visit new_user_registration_path
    #visit new_user_registration

    fill_in "Full name *", with: "John Doe"
    fill_in "Email", with: "john@example.com"
    fill_in "Password *", with: "password123"
    fill_in "Password confirmation", with: "password123"

    click_button "Sign up"

    expect(page).to have_text("Welcome! You have signed up successfully.")
  end
end