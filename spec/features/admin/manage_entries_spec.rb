require 'spec_helper'

feature 'Manage entries' do

  scenario 'Admin views statistics' do
    FactoryGirl.create_list :entry, 5
    FactoryGirl.create_list :entry, 5, referrer_id: 1
    expect_visit_to_require_basic_auth '/admin/entries', username: 'admin', password: 'password'
    expect(page).to have_text '10 entries (5 direct, 5 referred)'
  end

  scenario 'Admin downloads csv' do
    Entry.create! [
      {name: 'entry1', email: '1@example.com'},
      {name: 'entry2', email: '2@example.com'},
      {name: 'entry3', email: '3@example.com'},
    ]
    expect_visit_to_require_basic_auth '/admin/entries', username: 'admin', password: 'password'
    click_link 'Download CSV'
    expect(page.status_code).to eq 200
    expect(page.response_headers['Content-Type']).to start_with 'text/csv'
    expect(page).to have_text 'name,email'
    expect(page).to have_text 'entry1,1@example.com'
    expect(page).to have_text 'entry2,2@example.com'
    expect(page).to have_text 'entry3,3@example.com'
  end

  scenario 'Admin draws winners' do
    Entry.create! name: 'Winner Name', email: 'winner@example.com'

    expect_visit_to_require_basic_auth '/admin/entries', username: 'admin', password: 'password'
    click_button 'Draw Winners'
    expect(page).to have_text 'Winners:'
    expect(page).to have_text 'Winner Name'
    expect(page).to have_text 'winner@example.com'
  end

end