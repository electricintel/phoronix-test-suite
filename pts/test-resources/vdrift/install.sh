#!/bin/sh

tar -xjf vdrift-2009-06-15-src.tar.bz2
tar -xjf vdrift-benchmark-2.tar.bz2
cd vdrift-2009-06-15/
scons release=1

cd ..

mkdir -p ~/.vdrift/replays/
mv benchmark.vdr ~/.vdrift/replays/

echo "#!/bin/sh

echo \"[ control ]
autoclutch = true
autotrans = true
button_ramp = 0.000000
mousegrab = false
speed_sens_steering = 1.000000

[ display ]
width = \$1
height = \$2
FOV = 45.000000
anisotropic = 0
antialiasing = 0
bloom = true
camerabounce = 0.000000
depth = 16
fullscreen = true
input_graph = false
lighting = 0
mph = true
racingline = false
reflections = 1
shaders = true
shadow_distance = 2
shadow_quality = 2
shadows = true
show_fps = true
show_hud = true
skin = simple
texture_size = large
trackmap = true
view_distance = 2500.000000
zdepth = 24\" > ~/.vdrift/VDrift.config

cd vdrift-2009-06-15/
./build/vdrift -multithreaded -nosound -benchmark \$@ > \$LOG_FILE 2>&1" > vdrift
chmod +x vdrift
