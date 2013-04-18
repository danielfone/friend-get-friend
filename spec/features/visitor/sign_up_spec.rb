require 'spec_helper'

feature 'Sign Up' do

  scenario 'Visitor signs up successfully' do
    visit '/'
    fill_in 'Name', with: 'Test visitor'
    fill_in 'Email', with: 'test@example.com'
    check 'I want to sign up to the mailing list'
    click_button 'Sign Up'
    expect(page).to have_text 'Thanks for signing up Test visitor'
    expect(page).to have_text %r[\?r=\w+]
    expect(page).to have_link 'Share on Facebook'
    expect(page).to have_link 'Share on Twitter'
    expect(page).to have_link 'Share by Email'
  end

  scenario 'Visitor submits invalid info' do
    visit '/'
    click_button 'Sign Up'
    expect(page).to have_text "Name can't be blank"
    expect(page).to have_text "Email is invalid"
    expect(page).to have_text "Sign up must be accepted"
  end

  scenario 'Visitor signs up twice' do
    Entry.create! name: 'Test', email: 'test@example.com'
    visit '/'
    fill_in 'Name', with: 'Test visitor'
    fill_in 'Email', with: 'test@example.com'
    check 'I want to sign up to the mailing list'
    click_button 'Sign Up'
    expect(page).to have_text 'Email has already signed up'
  end

  scenario 'Referral signs up' do
    bob = Entry.create! name: 'Bob', email: 'bob@example.com'
    visit "/?r=#{bob.code}"
    fill_in 'Name', with: 'Test visitor'
    fill_in 'Email', with: 'test@example.com'
    check 'I want to sign up to the mailing list'
    click_button 'Sign Up'
    expect(page).to have_text "We've already given Bob another chance."
  end

  scenario 'Visitor connects insecurely' do
    visit '/'
    expect(current_url).to start_with 'https://'
  end

end
