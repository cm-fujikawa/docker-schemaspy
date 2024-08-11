FROM schemaspy/schemaspy:snapshot

WORKDIR /

USER root
RUN apt update && apt install -y \
        curl unzip graphviz fontconfig && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir download && cd download && \
    curl -k -O https://moji.or.jp/wp-content/ipafont/IPAexfont/ipaexg00401.zip && \
    unzip ipaexg00401.zip && \
    mkdir -p /usr/share/fonts/truetype/ipa && \
    cp */*ttf /usr/share/fonts/truetype/ipa && \
    fc-cache -fv && \
    cd .. && rm -rf download

USER java
