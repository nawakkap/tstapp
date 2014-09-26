class Schedule < ActiveRecord::Base
  belongs_to :backlog
  
  #validates_uniqueness_of :id, scope: [:backlog_id, :seq]
end
