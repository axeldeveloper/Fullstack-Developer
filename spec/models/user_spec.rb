require 'rails_helper'

RSpec.describe User, type: :model do
  describe "User Model" do

    it "is valid with valid attributes" do
      expect(User.new).to_not be_valid
    end

    it "is not valid without a full_name" do
      us = User.new(full_name: nil)
      expect(us).to_not be_valid
    end

    it "create a new user" do
      # user.photo.attach(io: URI.open("https://avatars.githubusercontent.com/u/5597266?s=400&v=4"), filename: "avatar")
      user = User.create(full_name: "User Tesr",  email: 'jane@doe.com', password: 'pw1234', role: false )
      expect(user.errors).to be_empty
    end
  end
end
