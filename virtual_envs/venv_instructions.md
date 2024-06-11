Create a virtual environment in command line:
python -m venv env_name      (I suggest venv_cpu, venv_cuda, venv_rocm depending on the compute hardware of your choosing)

Activate the venv in command line:
env_name\Scripts\activate

Install most of the required packages in command line inside the venv:
pip3 install -r requirements.txt

Install the pytorch variant of your choosing using the commands provided by https://pytorch.org/:
    for cpu:
        pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu

    for CUDA 12.1 (Nvidia graphics cards):
        1. install CUDA 12.1:
        https://developer.nvidia.com/cuda-12-1-0-download-archive
        2. install cuDNN 9.2.0:
        https://developer.nvidia.com/cudnn-downloads
        3. install pytorch for cuda inside the venv using the command line:
        pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121
    
    for ROCm (AMD graphics cards):
        technically possible, but requires Linux instead of Windows.

Upsides to using a GPU:
1. Much, much faster training and inference
Downsides to using a GPU:
1. More complex to set up
2. Can cause some (seemingly harmless) warnings and errors when training with visualization enabled (showing the godot game while training)

My recommendation is to set up both a CPU venv and a GPU venv, and to default to the GPU venv unless you encounter problems.

Now you are ready to run the code in the SafeRLCode folder!