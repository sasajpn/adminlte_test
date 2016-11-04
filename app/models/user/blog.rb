class User::Blog < ActiveRecord::Base
  validates :title, :content,
    presence: true
end
