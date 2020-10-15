if Spree.version.to_f < 4.0
  Deface::Override.new(
    virtual_path: 'spree/layouts/admin',
    name: 'pages_admin_sidebar_menu',
    insert_bottom: '#main-sidebar',
    partial: 'spree/admin/shared/pages_sidebar_menu'
  )
else
  Deface::Override.new(
    virtual_path: 'spree/admin/shared/_main_menu',
    name: 'pages_admin_sidebar_menu',
    insert_bottom: 'nav',
    partial: 'spree/admin/shared/pages_sidebar_menu'
  )
end