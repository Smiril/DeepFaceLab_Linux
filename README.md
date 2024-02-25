## Intro

This project provides scripts inspired by [DeepFaceLab_Linux](https://github.com/lbfs/DeepFaceLab_Linux) to setup and run [DeepFaceLab](https://github.com/Smiril/DeepFaceLab_Apple-Silicon) on MacOS.

You'll need `git`, `ffmpeg`, `python3` and python module `virtualenv` available to be able to execute these scripts. The scripts will create a virtual env sandbox and will install all necessary dependencies there, so your main installation of `python3` will be left intact.

## NOTE: FULL RUN

```

cd scripts
./2_extract_images_from_video_data_src.sh  
./3_extract_images_from_video_data_dst.sh
./4.1_data_src_extract_faces_S3FD.sh
./5_data_dst_extract_faces_S3FD.sh 
./6_train_AMP.sh
./7_convert_AMP.sh
./8_converted_to_avi.sh 

```

## Setup

**Tools**

Make sure you have installed:
- [Git](https://git-scm.com/) (check with `git --version`)
- [FFmpeg](https://ffmpeg.org/) (check with `ffmpeg -version`)
- [Python 3](https://www.python.org/) (check with `python3 --version`)

**Clone and setup**

1. Clone this repository (`git clone https://github.com/Smiril/DeepFaceLab_MacOS.git`)
2. Run script `./scripts/0_setup.sh` to get [DeepFaceLab](https://github.com/Smiril/DeepFaceLab_apple-Silicon.git), create virtual env and install necessary Python dependencies. This may take several minutes to run.

Now you can put your `data_src.mp4` and `data_dst.mp4` files into the `workspace/` dir and start running scripts from the `scripts/` dir.

## Tutorials and docs

See [DeepFaceLab](https://github.com/iperov/DeepFaceLab) project for links to guides and tutorials.
