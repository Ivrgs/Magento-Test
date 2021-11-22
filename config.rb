# require additional compass plugins here
# -----------------------------------------------------------------------------

# file paths
# -----------------------------------------------------------------------------
http_path = "/"
css_dir = "skin/frontend/GameCommerce Theme/default/css"
sass_dir = "skin/frontend/GameCommerce Theme/default/scss"
images_dir = "skin/frontend/GameCommerce Theme/default/images"
javascripts_dir = "skin/frontend/GameCommerce Theme/default/js"
fonts_dir = "skin/frontend/GameCommerce Theme/default/fonts"

output_style = :compressed # :expanded or :nested or :compact or :compressed
environment = :development

line_comments = false
cache = true
color_output = false # required for mixture

# SASS core
# -----------------------------------------------------------------------------

Sass::Script::Number.precision = 7 # chrome needs a precision of 7 to round properly