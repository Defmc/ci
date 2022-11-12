pwd="$(pwd)"
pkg=$1
vers=$2
cd "$pkg"
docker build -t "defmc/$pkg:latest" .
docker build -t "defmc/$pkg:$vers" .
docker push "defmc/$pkg:latest"
docker push "defmc/$pkg:$vers"
cd "$pwd"
