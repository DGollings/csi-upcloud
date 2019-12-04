FROM alpine:latest

# e2fsprogs-extra is required for resize2fs used for the resize operation
# blkid: block device identification tool from util-linux
RUN apk add ca-certificates \
    e2fsprogs \
    eudev \
    findmnt \
    xfsprogs \
    blkid \
    e2fsprogs-extra \
    util-linux

ADD upcloud-csi-plugin /bin/

ENTRYPOINT ["/bin/upcloud-csi-plugin"]
