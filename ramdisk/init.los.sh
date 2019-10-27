#!/system/bin/sh
# LineageOS tweaks and parameters
# Copyright (C) 2018-2019 KudProject Development
# Copyright (C) 2019 David Trpchevski (trpcevski.david@gmail.com)

# Allows us to get init-rc-like style
write() { echo "$2" > "$1"; }

# Switch to BFQ I/O scheduler
setprop sys.io.scheduler bfq

# Disable slice_idle on supported block devices
for block in mmcblk0 mmcblk1 dm-0 dm-1 sda; do
    write /sys/block/$block/queue/iosched/slice_idle 0
done

# Set read ahead to 128 kb for external storage
# The rest are handled by qcom-post-boot
write /sys/block/mmcblk1/queue/read_ahead_kb 128

# Reduce swappiness to a more reasonable value
write /proc/sys/vm/swappiness 60


