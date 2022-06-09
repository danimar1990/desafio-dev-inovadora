class CreateBreeds < ActiveRecord::Migration[7.0]
  def change
    create_table :breeds do |t|
      t.string :weight
      t.string :shortname
      t.string :name
      t.string :cfa_url
      t.string :vetstreet_url
      t.string :vcahospitals_url
      t.string :temperament
      t.string :origin
      t.string :country_codes
      t.string :country_code
      t.string :description
      t.string :life_span
      t.integer :indoor
      t.integer :lap
      t.string :alt_names
      t.integer :adaptability
      t.integer :affection_level
      t.integer :child_friendly
      t.integer :dog_friendly
      t.integer :energy_level
      t.integer :grooming
      t.integer :health_issues
      t.integer :intelligence
      t.integer :shedding_level
      t.integer :social_needs
      t.integer :stranger_friendly
      t.integer :vocalisation
      t.integer :experimental
      t.integer :hairless
      t.integer :natural
      t.integer :rare
      t.integer :rex
      t.integer :suppressed_tail
      t.integer :short_legs
      t.string :wikipedia_url
      t.integer :hypoallergenic
      t.string :reference_image_id
      t.string :image
      #t.references :user, null: true, foreign_key: true
      
      t.timestamps
    end
  end
end
