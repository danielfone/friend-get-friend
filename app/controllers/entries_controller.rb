class EntriesController < ApplicationController

  respond_to :html

  before_filter :save_referrer_code

  def new
    respond_with @entry = Entry.new
  end

  def create
    @entry = Entry.create params[:entry] do |entry|
      entry.referrer_code = session[:referrer_code]
    end
    session[:entry_id] = @entry.id
    respond_with @entry, location: entry_path
  end

  def show
    respond_with @entry = Entry.find(session[:entry_id])
  end

private

  def save_referrer_code
    session[:referrer_code] ||= params[:r]
  end

end
