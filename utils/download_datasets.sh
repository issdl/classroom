mkdir -p /opt/issdl/data/

# mnist
cd /opt/issdl/data/
wget -c https://github.com/myleott/mnist_png/raw/master/mnist_png.tar.gz
tar xvf mnist_png.tar.gz
chmod -R +xr mnist_png

# Tiny ImageNet - https://tiny-imagenet.herokuapp.com/
wget http://cs231n.stanford.edu/tiny-imagenet-200.zip 
unzip tiny-imagenet-200.zip
chmod -R +xr tiny-imagenet-200
