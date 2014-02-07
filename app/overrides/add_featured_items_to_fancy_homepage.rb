Deface::Override.new( :virtual_path  => "spree/home/landing",
                      :insert_bottom => "div.widgets",
                      :partial       => "partials/featured_products_widget",
                      :name          => "add_featured_products_to_fancy_homepage")