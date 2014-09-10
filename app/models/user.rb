class User < ActiveRecord::Base
	has_many :GameUsers
	has_many :Games, through: :GameUsers
	#has_and_belongs_to_many :friends
	has_many :friendships
	has_many :friends, through: :friendships
	has_many :comments
	#nochmal schauen:
	has_many :GameUsers, through: :comments
	has_many :ratings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, :age, presence: true 
end
