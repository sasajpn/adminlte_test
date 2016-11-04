class Admin::Blog < ActiveRecord::Base
  paginates_per 15
  validates :title, :content,
    presence: true
end
