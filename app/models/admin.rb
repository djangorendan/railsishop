class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable, :recoverable, :validatable and :omniauthable

  devise :database_authenticatable,
         :rememberable

end
