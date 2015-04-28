class Todo < ActiveRecord::Base
  belongs_to :list
  validates :todo_item, presence: true
end
