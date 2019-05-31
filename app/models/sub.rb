class Sub < ApplicationRecord
  validates :title, :moderator_id, presence: true

  belongs_to :moderator,
    primary_key: :id,
    foreign_key: :moderator_id,
    class_name: 'User',
    inverse_of: :subs

  has_many :posts,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: 'Post',
    dependent: :destroy
end
