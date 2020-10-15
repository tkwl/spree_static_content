class AddLayoutToTranslatableFields < SpreeExtension::Migration[4.2]
  def up
    if defined?(SpreeGlobalize)
      Spree::Page.add_translation_fields! layout: :string
    end
  end

  def down
    if defined?(SpreeGlobalize)
      remove_column :spree_page_translations, :layout
    end
  end
end
