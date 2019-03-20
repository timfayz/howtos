#!/bin/bash
exit

# Prepare env
install nodejs sass
npm i -D postcss-cli autoprefixer

# Complie CSS
sass --watch --no-source-map main.scss main.css

# Autoprefix
npx postcss main.css --use autoprefixer --replace [-d build/]

# Minify
?

# Run server
python -m SimpleHTTPServer 8000 &>/dev/null &