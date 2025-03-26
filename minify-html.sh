#!/bin/bash
# requires html-minifier to be installed (npm install -g html-minifier)
echo "Minifying HTML files..."

for file in *.html; do
    if [[ ! $file =~ \.min\.html$ ]]; then
        html-minifier --collapse-boolean-attributes \
            --collapse-whitespace \
            --decode-entities \
            --minify-css true \
            --minify-js true \
            --process-conditional-comments \
            --remove-attribute-quotes \
            --remove-comments \
            --remove-empty-attributes \
            --remove-optional-tags \
            --remove-redundant-attributes \
            --remove-script-type-attributes \
            --remove-style-link-type-attributes \
            --remove-tag-whitespace \
            --sort-attributes \
            --sort-class-name \
            --trim-custom-fragments \
            --use-short-doctype \
            "$file" -o "${file%.html}.min.html"
        echo "Minified: $file -> ${file%.html}.min.html"
    fi
done

echo "Minification complete!"