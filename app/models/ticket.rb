class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps
  
  field :subject
  field :description
  field :priority
  field :status
  
  attr_accessible :subject, :description, :priority, :status
  
  PRIORITY = %w[Low Medium High]
  STATUS = %w[Open Answered Customer-Reply On-hold Closed]
  
  validates :subject, :description, :presence => true
  
  belongs_to_related :user
  
end