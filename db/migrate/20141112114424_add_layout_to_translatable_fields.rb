class AddLayoutToTranslatableFields < ActiveRecord::Migration
  def up
    Spree::Page.add_translation_fields! layout: :string
  end

  def down
    remove_column :spree_page_translations, :layout
  end
end
