class Story < ActiveRecord::Base
  attr_accessible :story_title, :user_id
  
  has_many :pages
  
  belongs_to :user
  
  before_save :create_remember_token
  
  validates :story_title, :presence => true, :length => { :maximum => 140 }
  validates :user_id, :presence => true
  
  
  
  default_scope :order => 'stories.created_at DESC'
  
  
  private
  
  def create_remember_token
    self.remember_token = SecureRandom.urlsafe_base64
  end
end
