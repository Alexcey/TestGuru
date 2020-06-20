class User < ApplicationRecord
  has_many :test_passes
  has_many :tests, through: :test_passes
end
