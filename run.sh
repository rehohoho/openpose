export LD_LIBRARY_PATH=build/src/openpose/:build/caffe/lib:$LD_LIBRARY_PATH

FOLDER=/home/NTU-RGB+D/Dataset/nturgb+d_rgb/
NUM_FILES=$(ls $FOLDER | wc -l)
HALF_NUM_FILES=$(expr $NUM_FILES / 2)
echo $HALF_NUM_FILES

# for filename in $(find $FOLDER -name "*.avi" | sort | head -n $HALF_NUM_FILES); do
#   ./build/examples/openpose/openpose.bin \
#     --video $filename \
#     --write_json outputs/$(basename $filename) \
#     --face \
#     --hand \
#     --render_pose 0 \
#     --display 0 \
#     --num_gpu 1 \
#     --num_gpu_start 1
# done

for filename in $(find $FOLDER -name "*.avi" | sort | tail -n $HALF_NUM_FILES); do
  ./build/examples/openpose/openpose.bin \
    --video $filename \
    --write_json outputs/$(basename $filename) \
    --face \
    --hand \
    --render_pose 0 \
    --display 0 \
    --num_gpu 1 \
    --num_gpu_start 2
done

# Maximum accuracy config:
# ./build/examples/openpose/openpose.bin \
#   --net_resolution "1312x736" \
#   --scale_number 4 \
#   --scale_gap 0.25 \
#   --hand \
#   --hand_scale_number 6 \
#   --hand_scale_range 0.4 \
#   --face