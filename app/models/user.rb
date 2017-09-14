class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :gender, :age
  validates_inclusion_of :gender, in: %w(Male Female Other)
  validates :age, numericality: {
    greater_than_or_equal_to: 5,
    less_than_or_equal_to: 100
  }
  has_many :sushi_rolls, dependent: :destroy

  def is_old_enough?
    age >= 5 ? true : false
  end

  def self.by_age
    order(:age)
  end

  def had_too_much
    self.sushi_rolls.count >= 4 ? true : false
  end

end
