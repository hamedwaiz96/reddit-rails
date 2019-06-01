class Comment < ApplicationRecord
  validates :content, :author_id, :post_id, presence: true

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: 'Post',
    inverse_of: :comments

  belongs_to :author,
    primary_key: :id,
    foreign_key: :author_id,
    class_name: 'User',
    inverse_of: :comments

  belongs_to :parent_coment,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: 'Comment',
    optional: true

  has_many :child_comments,
    primary_key: :id,
    foreign_key: :parent_comment_id,
    class_name: 'Comment'

end
