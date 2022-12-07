# sync rom
repo init --depth=1 --no-repo-verify -u https://github.com/SuperiorOS/manifest -b twelvedotone -g default,-mips,-darwin,-notdefault
git clone https://github.com/Kneba/local_manifests --depth 1 -b superior .repo/local_manifests
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# build rom
. build/envsetup.sh
lunch superior_X00TD-userdebug
export TZ=Asia/Jakarta
#export ALLOW_MISSING_DEPENDENCIES=true
#export SELINUX_IGNORE_NEVERALLOWS=true
m bacon -j8
# end
