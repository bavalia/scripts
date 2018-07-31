D=$(date +%F)
# D=$(date +%Y_%m_%d)

echo ./$D/imgs_L
echo ./$D/$D.txt
echo ./$D/$D*
echo "saving data to folder ~/Documetnts/data/$D"

mkdir ./$D
if [ ! -f ./$D/status ]; then
    echo 0 > status
fi
# I=$(ls -l $D |wc -l)
I=$(($(cat status) + 1))
echo $I > status

mkdir ./$D/$I
mkdir ./$D/$I/img_L
mkdir ./$D/$I/img_R

# change date format from /22_12_2017/22_12_2017.txt to /2017-12-22/$I/2017-12-22.txt in cpp file and then compile
# -r is for advanced scripting like support for '+' for one or more match
cat dataCollectLRM_Threaded.cpp | \
sed -r "s/[0-9]+_[0-9]+_[0-9]+\//&$I\//" | \
sed -r "s/[0-9]+_[0-9]+_[0-9]+/$D/g" > dataCollectLRM_Threaded_Today.cpp
# sed -r s/[0-9]+_[0-9]+_[0-9]+/$D/g temp.cpp > dataCollectLRM_Threaded_Today.cpp
# g++ ./dataCollectLRM_Threaded_Today.cpp -o dataCollectLRM `pkg-config --cflags --libs opencv` `pkg-config --cflags --libs lcm` -std=c++11 -O3


diff dataCollectLRM_Threaded.cpp dataCollectLRM_Threaded_Today.cpp

# mkdir -p ./$(D)/imgs_L
# mkdir ~/Documents/data/22_12_2017/imgs_L
# mkdir ~/Documents/data/22_12_2017/imgs_R
# mkdir ~/Documents/data/22_12_2017/imgs_M
# rm ~/Documents/data/22_12_2017/22_12_2017.txt
# rm ~/Documents/data/22_12_2017/22_12_2017*
# ./dataCollectLRM
