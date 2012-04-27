class Page < ActiveRecord::Base
  attr_accessible :pagecontent, :story_id, :user_id
  
  belongs_to :story
  belongs_to :user
  
  validates :pagecontent, :presence => true, :length => { :maximum => 1000 }
  validates :story_id, :presence => true
  validates :user_id, :presence => true
  
  default_scope :order => 'pages.created_at DESC'
end
