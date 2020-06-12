# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )

# ckeditor
Rails.application.config.assets.precompile += %w[ckeditor/config.js]

# bitext
Rails.application.config.assets.precompile += %w( bigtext.js )

# nestable
Rails.application.config.assets.precompile += %w( nestable.js )
Rails.application.config.assets.precompile += %w( nestable.css )

# owl_carousel
Rails.application.config.assets.precompile += %w( owl_carousel/owl.carousel.js )
Rails.application.config.assets.precompile += %w( owl_carousel/assets/owl.carousel.css )

# custom_css
  #admins_css
Rails.application.config.assets.precompile += %w( admin/category.css )
Rails.application.config.assets.precompile += %w( admin/product.css )

  #main_part_css
Rails.application.config.assets.precompile += %w( main.css )
Rails.application.config.assets.precompile += %w( header.css )
Rails.application.config.assets.precompile += %w( side_bar.css )
Rails.application.config.assets.precompile += %w( filter_form.css )
Rails.application.config.assets.precompile += %w( products_list.css )
Rails.application.config.assets.precompile += %w( product.css )
Rails.application.config.assets.precompile += %w( cart.css )
Rails.application.config.assets.precompile += %w( order.css )
Rails.application.config.assets.precompile += %w( compare.css )

# custom_js
  #admin_js
Rails.application.config.assets.precompile += %w( admin/category.js )
Rails.application.config.assets.precompile += %w( admin/property.js )
Rails.application.config.assets.precompile += %w( admin/product.js )

  #main_part_js
Rails.application.config.assets.precompile += %w( layout.js )
Rails.application.config.assets.precompile += %w( product.js )
Rails.application.config.assets.precompile += %w( cart.js )
Rails.application.config.assets.precompile += %w( order.js )
Rails.application.config.assets.precompile += %w( compare.js )
