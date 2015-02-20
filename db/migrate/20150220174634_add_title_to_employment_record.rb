class AddTitleToEmploymentRecord < ActiveRecord::Migration
  def change
    add_column :employment_records, :title, :string
  end
end
