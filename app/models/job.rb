class Job < ActiveRecord::Base
  belongs_to :project
  belongs_to :quality
  belongs_to :user, :class_name => "User", :foreign_key => "author_id"
  belongs_to :status
  
  validates_presence_of :keywords
  validates_presence_of :instructions
  
  validates_presence_of :quality_id
  validates_presence_of :project_id
      
  # named_scope :from_author, :joins => :table, :conditions => ['field = ?', true]
  named_scope :status, lambda { |label| {:joins => :status, :conditions => ['statuses.label = ?', label] }}

  named_scope :pending,      {:joins => :status, :conditions => ['statuses.label = ?', "pending"] }
  named_scope :in_progress,   {:joins => :status, :conditions => ['statuses.label = ? OR statuses.label = ?', "taken", "improve"] }
  named_scope :finished,      {:joins => :status, :conditions => ['statuses.label = ?', "ready"] }
  named_scope :to_review,     {:joins => :status, :conditions => ['statuses.label = ? OR statuses.label = ?', "review", "improved"] }
  

end
