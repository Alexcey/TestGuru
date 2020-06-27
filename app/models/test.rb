class Test < ApplicationRecord
  belongs_to :category
  has_many :questions, dependent: :destroy
  has_many :test_passes, dependent: :destroy
  has_many :users, through: :test_passes
  belongs_to :author, class_name: 'User'

  validates :title, presence: true
  validates :level, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :title, presence: true,
                    uniqueness: {scope: :level}

  def category_where_title(title)
    Test.joins(:category).where('categories.title = ?', title).order(title: :desc).pluck(:title)
  end
end
