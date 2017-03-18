class AddAttributesToBoats < ActiveRecord::Migration[5.0]
  def change
    add_column :boats, :starts_at, :datetime
    add_column :boats, :ends_at, :datetime
    add_column :boats, :organizer, :string
    add_column :boats, :street_address, :string
    add_column :boats, :zipcode, :integer
    add_column :boats, :city, :string
    add_column :boats, :objectives, :string
    add_column :boats, :conditions, :string
  end
end
