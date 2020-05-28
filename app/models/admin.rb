class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :registerable, :validatable and :omniauthable

  devise :database_authenticatable,
         :rememberable,
         :recoverable

end
