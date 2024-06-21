class Company < ApplicationRecord
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    validates :email_id, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :company_name, presence: true, length: { minimum: 5 }
    validates :company_code, uniqueness: true
    validates :strength, :numericality => true
end
