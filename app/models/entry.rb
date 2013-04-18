class Entry < ActiveRecord::Base
  attr_accessible :email, :name, :sign_up
  attr_accessor :sign_up
  attr_accessor :referrer_code

  belongs_to :referrer, class_name: 'Entry'

  validates :name, presence: true
  validates :email, format: /.+@.+\..+/
  validates :sign_up, acceptance: true

  before_create :generate_code
  before_create :find_referrer, if: :referrer_code

  def save(*args)
    super
  rescue ActiveRecord::RecordNotUnique
    errors.add :email, 'has already signed up'
    return false
  end

  def referrer_name
    referrer.name if referrer
  end

private

  def generate_code
    self.code = SecureRandom.hex
  end

  def find_referrer
    self.referrer = Entry.where(code: referrer_code).first
  end

end
