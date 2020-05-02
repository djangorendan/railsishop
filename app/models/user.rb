class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, :validatable and :omniauthable
  has_many :orders, dependent: :nullify
  has_many :product_comments, dependent: :destroy

  def full_name
    first_name+' '+last_name
  end

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

   validates :email, :first_name, :last_name, :phone, presence: true
   validates :phone, numericality: true
   validates :phone, uniqueness: true

   # attr_accessor :skip_password_validation  # virtual attribute to skip password validation while saving
   #
   #   protected
   #
   #   def password_required?
   #     return false if skip_password_validation
   #     super
   #   end

end
