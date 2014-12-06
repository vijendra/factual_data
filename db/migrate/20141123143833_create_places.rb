class CreatePlaces < ActiveRecord::Migration
  def change
    #{"name"=>"String", "address"=>"String", "address_extended"=>"String", "po_box"=>"String", "locality"=>"String", "region"=>"String", "postcode"=>"String", "website"=>"String", "latitude"=>"Decimal", "longitude"=>"Decimal", "country"=>"String", "factual_id"=>"String", "tel"=>"String", "fax"=>"String", "email"=>"String", "category_ids"=>"Integer", "category_labels"=>"String", "chain_id"=>"String", "chain_name"=>"String", "neighborhood"=>"String", "admin_region"=>"String", "hours"=>"String", "hours_display"=>"String"}
    execute "CREATE EXTENSION IF NOT EXISTS hstore"
    
    create_table :places do |t|
      t.string :name
      t.string :address
      t.string :address_extended
      t.string :po_box
      t.string :locality
      t.string :region
      t.string :postcode
      t.string :website
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :factual_id
      t.string :tel
      t.string :fax
      t.string :email
      t.string :chain_id
      t.string :chain_name
      t.string :neighborhood, array: true, default: []
      t.string :admin_region
      
       
      t.string :category_ids, array: true, default: []
      t.string :category_labels, array: true, default: []
      
      t.hstore :hours
      t.text :hours_display
      t.timestamps
    end
  end
end
