class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable
         # :confirmable, :lockable, :timeoutable, :omniauthable, :registerable

  validates :name, presence: true

end
