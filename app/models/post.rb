class Post < ApplicationRecord
  validates :title, :author_id, presence: true
  validates :subs, presence: { message: "Choose at least one" }

  has_many :post_subs, inverse_of: :post, dependent: :destroy

  has_many :subs,
    through: :post_subs,
    source: :sub

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User',
    inverse_of: :posts

  

end
