class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :expense_items, foreign_key: :author_id
  has_many :categories, foreign_key: :author_id

  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
end
