#!/bin/bash
LINKS="<a href='maths-function-mean.html'>maths-function-mean</a>"

gen_link () {
    HTML=$1
    BASE=${HTML%.html}
    echo "<a href='"$HTML"'>"$BASE"</a><br />"
}

gen_links (){
    for i in $(ls -1 *html | grep -v index.html); do
        gen_link $i
    done
}
LINKS=$(gen_links)

cat <<INDEXFILE
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/katex.min.css" integrity="sha384-TEMocfGvRuD1rIAacqrknm5BQZ7W7uWitoih+jMNFXQIbNl16bO8OZmylH/Vi/Ei" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/katex.min.js" integrity="sha384-jmxIlussZWB7qCuB+PgKG1uLjjxbVVIayPJwi6cG6Zb4YKq0JIw+OMnkkEC7kYCq" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/KaTeX/0.9.0/contrib/auto-render.min.js" integrity="sha256-HkMrKMLKQk4t1R2ofMAcLz72fWM2sshnx6215U+LgU0=" crossorigin="anonymous"></script>
</head>
<body>
$LINKS
</body>
</html>
INDEXFILE

