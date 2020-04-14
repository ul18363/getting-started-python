# GPU Set Up
Right now I'm using a NVIDIA Quadro P620 graphic card and an Intel  card.

1. Goal: 
    1. To get the drivers working
        1. Terminal: nvidia-smi 
    2. To get TensorFlow to identify the GPU

# Useful checks:

## List hardware
1. Command:
 1. lspci -v | grep VGA
2. Results:
 1. 00:02.0 VGA compatible controller: Intel Corporation Device 3e92 (prog-if 00 [VGA controller])
 2. 01:00.0 VGA compatible controller: NVIDIA Corporation GP107GL [Quadro P620] (rev a1) (prog-if 00 [VGA controller])


# Comments along the way:
    When no nvidia library package or whatever is installed for some reason when running nvidia-smi it is recommended to install the following 2 packages:
        sudo apt install nvidia-340      
        sudo apt install nvidia-utils-390
        
# Common Problems and how to fix them 

0. Error:
    1. Command: nvidia-smi
    2. Message: NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.
    3. Solution: TODO
        1. Alternative A: (Fried my system!)
            1. sudo apt install nvidia-prime
            2. sudo prime-select nvidia
            3.  Please check if the file /lib/modprobe.d/blacklist-nvidia.conf exists (if does DELETE IT!)
            4. sudo update-initramfs -u
        2. Alternative B: (On a Fresh system)
            1. sudo apt install nvidia-utils-390
        3. Alternative C:
        4. Alternative D:



1. Broken pipeline for file:
    1. Command: Various install commands
    2. Solution: sudo dpkg -i --force-overwrite /var/cache/apt/archives/nvidia-utils-390_390.116-0ubuntu0.18.04.3_amd64.deb
    2. sudo apt -f install



