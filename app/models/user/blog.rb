class User::Blog < ActiveRecord::Base
  paginates_per 10
  validates :title, :content,
    presence: true
end
