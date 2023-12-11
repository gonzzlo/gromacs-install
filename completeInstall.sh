###(1) Update the system 
sudo apt update
sudo apt upgrade
sudo apt install gcc
sudo apt install build-essential
sudo apt install libfftw3-dev
sudo apt install cmake

#Download Gromacs
wget https://ftp.gromacs.org/gromacs/gromacs-2023.3.tar.gz

###(2) Install CUDA
##Versions are different for the PC's
###https://developer.nvidia.com/cuda-downloads

#BASE INSTALL:

wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-ubuntu2204.pin
sudo mv cuda-ubuntu2204.pin /etc/apt/preferences.d/cuda-repository-pin-600
wget https://developer.download.nvidia.com/compute/cuda/12.3.1/local_installers/cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo dpkg -i cuda-repo-ubuntu2204-12-3-local_12.3.1-545.23.08-1_amd64.deb
sudo cp /var/cuda-repo-ubuntu2204-12-3-local/cuda-*-keyring.gpg /usr/share/keyrings/
sudo apt-get update
sudo apt-get -y install cuda-toolkit-12-3

##DRIVER INSTALL:

sudo apt-get install -y nvidia-kernel-open-545
sudo apt-get install -y cuda-drivers-545

#Reboot

nvidia-smi 

###(3) Install GROMACS

tar xfz gromacs-2023.3.tar.gz 
cd gromacs-2023.3
mkdir build
cd build
cmake .. -DGMX_GPU=CUDA -DCUDA_TOOLKIT_ROOT_DIR=/usr/local/cuda
make
