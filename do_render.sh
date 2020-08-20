#!/bin/bash

DOCKER_IMAGE=iml/blender:2.83.5
BLENDER_FILE=/media/DortmundSzene1_SuperRechner.blend

nvidia-docker run \
  --runtime=nvidia \
  -e NVIDIA_VISIBLE_DEVICES=all \
  --rm \
  -v /home/nvidia/media:/media \
  $DOCKER_IMAGE $BLENDER_FILE --engine CYCLES --debug-gpu --threads 0 --python /media/force_gpu.py --render-output /media/output/frame_### -a

#nvidia-docker run --rm \
#  --entrypoint "/bin/bash" \
#  $DOCKER_IMAGE python /media/force_gpu.py

