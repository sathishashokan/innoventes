class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :company_name
      t.string :email_id
      t.string :company_code
      t.integer :strength
      t.string :web_site

      t.timestamps
    end
  end
end
