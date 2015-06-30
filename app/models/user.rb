class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_one :profile
  has_many :posts
  has_many :comments

  accepts_nested_attributes_for :profile, :allow_destroy => true, :reject_if => :all_blank

end
