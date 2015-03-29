class Phone < ActiveRecord::Base

  has_many :sent, class: Message, foreign_key: :from_id
  has_many :received, class: Message, foreign_key: :to_id

end
