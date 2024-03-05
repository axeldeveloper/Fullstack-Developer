require 'rails_helper'

RSpec.describe "User routes", type: :routing do
  # Test for the routes of the devise_for :users in config/routes.rb
  it "routes to user registrations controller" do
    expect(get: "/users/sign_in").to route_to("devise/sessions#new")
    expect(post: "/users").to route_to("devise/registrations#create")
  end

  it "routes to user sessions controller" do
    expect(get: "/users/sign_in").to route_to("devise/sessions#new")
    expect(post: "/users/sign_in").to route_to("devise/sessions#create")
  end

  it "routes to user passwords controller" do
    expect(get: "/users/password/new").to route_to("devise/passwords#new")
    expect(get: "/users/password/edit").to route_to("devise/passwords#edit")
    expect(patch: "/users/password").to route_to("devise/passwords#update")
    expect(put: "/users/password").to route_to("devise/passwords#update")
    expect(post: "/users/password").to route_to("devise/passwords#create")
  end

end
