class EntriesController < ApplicationController

  respond_to :html

  def new
    respond_with @entry = Entry.new
  end

  def create
    @entry = Entry.create params[:entry]
    session[:entry_id] = @entry.id
    respond_with @entry, location: entry_path
  end

  def show
    respond_with @entry = Entry.find(session[:entry_id])
  end

end
