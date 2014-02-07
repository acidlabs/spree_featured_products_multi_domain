Deface::Override.new(:virtual_path => "spree/admin/shared/_configuration_menu",
                     :name => "featured_products_admin_configurations_menu",
                     :insert_bottom => "[data-hook='admin_configurations_sidebar_menu']",
                     :text => "<%= configurations_sidebar_menu_item Spree.t(:featured_product), admin_featured_products_url %>",
                     :disabled => false)