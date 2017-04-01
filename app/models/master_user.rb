class MasterUser < ApplicationRecord
  validates_presence_of :email, :name, :role_id, :start_job_level

  def self.forge_params(params={})
  	master = MasterUser.find_by_email(params[:email])
  	return params.merge({name: master.name, role_id: master.role_id, job_level: master.start_job_level})
  end
end