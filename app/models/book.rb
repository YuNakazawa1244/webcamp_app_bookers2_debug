class Book < ApplicationRecord
# 以下問９デバッグ訂正
	belongs_to :user
	# has_many :user
# 以上デバッグ
	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
