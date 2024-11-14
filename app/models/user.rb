class User < ApplicationRecord
  validate :email_domain

  private

  def email_domain
    unless email =~ /\A[\w+\-.]+@gmail\.com\z/i
      errors.add(:email, "debe tener el dominio @gmail.com")
    end
  end
end
