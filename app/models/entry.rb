class Entry < ActiveRecord::Base
  attr_accessible :email, :name, :sign_up
  attr_accessor :sign_up
end
