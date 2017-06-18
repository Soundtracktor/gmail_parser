# frozen_string_literal: true

class Search < ApplicationRecord
  has_secure_token
  validates :from_date, :to_date, :email, :encrypted_password, presence: true

  def password=(value)
    return unless value
    self[:encrypted_password] = crypt.encrypt_and_sign(value)
  end

  def password
    return unless encrypted_password
    crypt.decrypt_and_verify(encrypted_password)
  end

  private

  def crypt
    ActiveSupport::MessageEncryptor.new(key)
  end

  def salt
    # SecureRandom.random_bytes(64)
    ENV['SALT']
  end

  def key
    ActiveSupport::KeyGenerator.new(
      Rails.application.secrets.secret_key_base
    ).generate_key(salt, 32)
  end
end
