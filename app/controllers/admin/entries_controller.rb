class Admin::EntriesController < ApplicationController

  before_filter :require_auth

  respond_to :html, :csv

  def index
    respond_with @entries = Entry.scoped
  end

  def draw_winners
    Entry.draw_winners!
    redirect_to :back
  end

private

  def require_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'admin' && password == 'password'
    end
  end

end
