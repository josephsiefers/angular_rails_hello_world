class CreateEmploymentRecords < ActiveRecord::Migration
  def change
    create_table :employment_records do |t|
      t.integer :profile_id
      t.integer :employer_id
      t.date :from
      t.date :to

      t.timestamps null: false
    end
  end
end
