class Test < ApplicationRecord
  has_many :test_passes
  has_many :users, through: :test_passes
end
