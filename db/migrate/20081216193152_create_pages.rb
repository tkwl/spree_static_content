class CreatePages < SpreeExtension::Migration[4.2]
  def self.up
    create_table :spree_pages do |t|
      t.string :title
      t.text :body
      t.string :slug

      t.timestamps null: false
    end
  end

  def self.down
    drop_table :spree_pages
  end
end
