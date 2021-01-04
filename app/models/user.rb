class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname
    validates :birth_date
  end

  VALID_FULL_WIDTH_REGEX = /\A[ぁ-んァ-ヶ一-龥々]+\z/
  with_options presence: true, format: { with: VALID_FULL_WIDTH_REGEX, message: "Full-width characters" } do
    validates :first_name
    validates :last_name
  end

  VALID_NAME_KANA_REGEX = /\A[ァ-ヶ]+\z/
  with_options presence: true, format: { with: VALID_NAME_KANA_REGEX, message: "Full-width katakana characters" } do
    validates :first_name_kana
    validates :last_name_kana
  end

  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates_format_of :password, with: VALID_PASSWORD_REGEX, message: "Include both letters and numbers"
end
