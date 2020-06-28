class User < ApplicationRecord
  has_many :test_passes
  has_many :tests, through: :test_passes
  has_many :authored_tests, class_name: 'Test', foreign_key: 'author_id'

  validates :email, presence: true

  def tests_where_level(level)
    tests.where(level: level)
  end
end
