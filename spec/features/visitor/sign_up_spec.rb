require 'spec_helper'

feature 'Sign Up' do

  scenario 'Visitor signs up successfully' do
    visit '/'
    fill_in 'Name', with: 'Test visitor'
    fill_in 'Email', with: 'test@example.com'
    check 'I want to sign up to the mailing list'
    click_button 'Sign Up'
    expect(page).to have_text 'Thanks for signing up Test visitor'
  end

  scenario 'Visitor submits invalid info' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_text "Name can't be blank"
    expect(page).to have_text "Email is invalid"
    expect(page).to have_text "Sign up must be accepted"
  end

end
