module FeatureAuthHelper

  def expect_visit_to_require_basic_auth(path, opts={})
    basic_auth nil, nil
    visit path
    expect(page.status_code).to eq 401
    basic_auth opts[:username], opts[:password]
    visit path
    expect(page.status_code).to eq 200
  end

  def basic_auth(username, password)
    page.driver.browser.basic_authorize username, password
  end

end