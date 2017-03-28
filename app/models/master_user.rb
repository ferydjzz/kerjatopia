class MasterUser < ApplicationRecord
  validates_presence_of :email, :full_name, :role_id, :start_job_level
end