FROM schemaspy/schemaspy:snapshot
USER root
WORKDIR /
RUN apk update && \
    apk add --no-cache curl fontconfig && \
    mkdir download && \
    cd download && \
    curl -k -O https://moji.or.jp/wp-content/ipafont/IPAexfont/ipaexg00401.zip && \
    unzip ipaexg00401.zip && \
    mkdir -p /usr/share/fonts/truetype/ipa && \
    cp */*ttf /usr/share/fonts/truetype/ipa && \
    fc-cache -fv && \
    rm -rf download
