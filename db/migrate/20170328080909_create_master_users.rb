class CreateMasterUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :master_users do |t|
      t.string :email
      t.integer :role_id
      t.integer :start_job_level
      t.string :full_name
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
