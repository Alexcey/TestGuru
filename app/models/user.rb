class User < ApplicationRecord
  has_many :test_passes
  has_many :tests, through: :test_passes

  def tests_where_level(level)
    tests.where(level: level)
  end
end
