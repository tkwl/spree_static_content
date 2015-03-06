Deface::Override.new(virtual_path:  "spree/layouts/admin",
                     name:          "pages_admin_configurations_menu",
                     insert_bottom: "#main-sidebar",
                     text:          "<% if Spree.user_class && can?(:admin, Spree::Page) %><ul class='nav nav-sidebar'><%= tab Spree.t(:PAGES), url: admin_pages_path, icon: 'file' %></ul><% end %>",
                     disabled:      false)


