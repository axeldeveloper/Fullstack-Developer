require 'rails_helper'

RSpec.feature 'Login', type: :feature do
  let(:user) { create(:user) }
  #user = FactoryBot.create(:user)

  # This scenario tests if a user logs in successfully
  scenario 'user logs in successfully' do
    visit new_user_session_path

    # Fill in email and password fields with valid user credentials and click on submit button
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
    expect(page).to have_content('Signed in successfully.')
  end


  # This scenario tests if a user logs in successfully
  scenario 'user is admin' do
    visit new_user_session_path

    # Fill in email and password fields with valid user credentials and click on submit button
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'

    # Expect to be redirected to the user admin or dashboard page and see success message
    expect(page).to have_current_path(admin_dashboard_path) if user.role?
    #expect(page).to have_current_path(users_path) if :user && :user.admin?
  end

  # This scenario tests if a user enters incorrect credentials
  scenario 'user enters incorrect credentials' do
    visit new_user_session_path

    # Fill in email and password fields with invalid password and click on submit button
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'incorrectpassword'
    click_on 'Log in'

    # Expect to stay on the same page and see error message
    expect(page).to have_current_path(new_user_session_path)
    expect(page).to have_content('Invalid Email or password.')
  end
end
