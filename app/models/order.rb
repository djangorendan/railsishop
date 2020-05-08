class Order < ApplicationRecord
  belongs_to :cart
  belongs_to :user

  def full_name
    first_name+' '+last_name
  end

  validates :email, :first_name, :last_name, :phone, presence: true
  validates :phone, numericality: true

  scope :news, -> { where(status: 'Новый') } #новые
  scope :accepted, -> { where(status: 'Принят') } #принятые
  scope :paid, -> { where(status: 'Оплачен') } #оплаченые
  scope :sent, -> { where(status: 'Отправлен') } #отправленные
  scope :completed, -> { where(status: 'Выполнен') } #выполненные
  scope :canceled, -> { where(status: 'Отменен') } #отмененные

  scope :state, -> state { where(status: state) }

end
