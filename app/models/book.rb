class Book < ActiveRecord::Base
  attr_accessible :author_id, :isbn, :title

  #belongs_to :author
end
