FROM schemaspy/schemaspy:snapshot

WORKDIR /

USER root
RUN apk update && \
    apk add --no-cache curl unzip graphviz fontconfig && \
    mkdir download && cd download && \
    curl -k -O https://moji.or.jp/wp-content/ipafont/IPAexfont/ipaexg00401.zip && \
    unzip ipaexg00401.zip && \
    mkdir -p /usr/share/fonts/truetype/ipa && \
    cp */*ttf /usr/share/fonts/truetype/ipa && \
    fc-cache -fv && \
    apk del curl && \
    rm -rf /var/cache/apk/* && \
    cd .. && rm -rf download

USER java
