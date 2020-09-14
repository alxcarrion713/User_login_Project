class User < ActiveRecord::Base
    before_validation puts 'starting validation'
    after_save puts 'done got saved'

    EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
    validates :first_name, :last_name, presence: true, length: { minimum: 2 }
    validates :email_address, presence:true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
    validates :age, presence:true, numericality: { greater_than: 10 }, numericality: {less_than: 150}
end
