class Project < ActiveRecord::Base

  belongs_to :administrator
  has_many :jobs


  validates_presence_of     :name
  validates_presence_of     :description
  validates_length_of       :name, :within => 4..40
  validates_length_of       :description,    :within => 3..2000
  

end
