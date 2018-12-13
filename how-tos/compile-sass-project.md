0. Prepare env
install nodejs sass
npm i -D postcss-cli autoprefixer

1. Complie CSS
sass --watch --no-source-map main.scss main.css

2. Autoprefix
npx postcss main.css --use autoprefixer --replace [-d build/]

3. Minify
?

* Run server
python -m SimpleHTTPServer 8000 &>/dev/null &
