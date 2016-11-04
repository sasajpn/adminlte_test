class Admin::Blog < ActiveRecord::Base
  validates :title, :content,
    presence: true
end
