class Entry < ActiveRecord::Base
  attr_accessible :email, :name, :sign_up
  attr_accessor :sign_up

  validates :name, presence: true
  validates :email, format: /.+@.+\..+/
  validates :sign_up, acceptance: true

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique
    errors.add :email, 'has already signed up'
    return false
  end

end
