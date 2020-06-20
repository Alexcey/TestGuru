class Test < ApplicationRecord
  #belongs_to :category
  has_many :test_passes
  has_many :users, through: :test_passes

  def category_where_title(title)
    Test.joins(:category).where('categories.title = ?', title).order(title: :desc)
  end
end
