# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password
  has_many :posts
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
end
