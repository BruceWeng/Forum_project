class Post < ActiveRecord::Base
  validates_presence_of :title
  has_many :comments
  has_many :post_categoryships
  has_many :categories, :through => :post_categoryships
end
