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

## Disable Secure Boot
1. Command:
    sudo mokutil --disable-validation.

# Comments along the way:
    When no nvidia library package or whatever is installed for some reason when running nvidia-smi it is recommended to install the following 2 packages:
        sudo apt install nvidia-340      
        sudo apt install nvidia-utils-390
        
# Common Problems and how to fix them 

0. NVIDIA driver not working:
    0. Command: nvcc --version
        1. Message:
            Command 'nvcc' not found, but can be installed with:
            sudo apt install nvidia-cuda-toolkit
        2. Solution:
            sudo apt install nvidia-cuda-toolkit
            0. Result:
                nvcc: NVIDIA (R) Cuda compiler driver
                Copyright (c) 2005-2017 NVIDIA Corporation
                Built on Fri_Nov__3_21:07:56_CDT_2017
                Cuda compilation tools, release 9.1, V9.1.85

    1. Command: nvidia-smi
        1. Message: 
            Command 'nvidia-smi' not found, but can be installed with:
                sudo apt install nvidia-340      
                sudo apt install nvidia-utils-390
            1. Solution:
                1. sudo apt install nvidia-utils-390 -> Gets me to 'NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver.'
                2. Continuation: Change the driver from 'Software & Updates' to nvidia 395.-> UEFI Secure Boot enabled -> Is being reported that secure boot causes problem and I need to disable afterwards
        2. Message: NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver. Make sure that the latest NVIDIA driver is installed and running.
            1. Working Solution: 
                sudo apt install nvidia-cuda-toolkit
                sudo ubuntu-drivers autoinstall
                sudo reboot
                F12 as soon as reboots -> Make sure Secure Boot is disable (check BIOS)

                Result:
                    $ nvidia-smi
                    Wed Apr 15 00:17:34 2020       
                    +-----------------------------------------------------------------------------+
                    | NVIDIA-SMI 440.82       Driver Version: 440.82       CUDA Version: 10.2     |
                    |-------------------------------+----------------------+----------------------+
                    | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
                    | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
                    |===============================+======================+======================|
                    |   0  Quadro P620         Off  | 00000000:01:00.0 Off |                  N/A |
                    | 34%   49C    P0    N/A /  N/A |    446MiB /  2000MiB |     13%      Default |
                    +-------------------------------+----------------------+----------------------+
                                                                                                   
                    +-----------------------------------------------------------------------------+
                    | Processes:                                                       GPU Memory |
                    |  GPU       PID   Type   Process name                             Usage      |
                    |=============================================================================|
                    |    0      1505      G   /usr/lib/xorg/Xorg                           230MiB |
                    |    0      1679      G   /usr/bin/gnome-shell                         113MiB |
                    |    0      2301      G   ...AAAAAAAAAAAACAAAAAAAAAA= --shared-files    98MiB |
                    +-----------------------------------------------------------------------------+


            2. Alternative Solution: 
                1. Alternative A: (Fried my system!)
                    1. sudo apt install nvidia-prime
                    2. sudo prime-select nvidia
                    3.  Please check if the file /lib/modprobe.d/blacklist-nvidia.conf exists (if does DELETE IT!)
                    4. sudo update-initramfs -u
                2. Alternative B: (On a Fresh system)
                    1. sudo apt install nvidia-utils-390
                    2. sudo reboot -> No changes
                3. Alternative C:
                    1. sudo apt install --reinstall nvidia-driver-430
                        Warning: 'The home dir /nonexistent you specified can't be accessed: No such file or directory'
                4. Alternative D:
                        sudo apt purge 'nvidia.*'
                        sudo add-apt-repository ppa:graphics-drivers/ppa
                        sudo apt update
                        sudo apt install nvidia-390 # Failed No such package
                5. Alternative D:
                        sudo apt purge 'nvidia.*'
                        sudo add-apt-repository ppa:graphics-drivers/ppa
                        sudo apt update
                        sudo apt install nvidia-390
                6. Alternative D:
                        sudo ubuntu-drivers autoinstall

1. Broken pipeline for file:
    1. Command: Various install commands
    2. Solution: sudo dpkg -i --force-overwrite /var/cache/apt/archives/nvidia-utils-390_390.116-0ubuntu0.18.04.3_amd64.deb
    2. sudo apt -f install



