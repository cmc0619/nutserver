FROM lsiobase/alpine
RUN mkdir -p /app/nutserver \
&& apk upgrade --no-cache && apk add --no-cache musl build-base python3 python3-dev bash libffi-dev openssl-dev libjpeg-turbo-dev git \
&& pip3 install --no-cache-dir --upgrade pip colorama pyopenssl requests tqdm unidecode Pillow BeautifulSoup4 urllib3 Flask google-api-python-client google-auth-oauthlib \
&& cd /app/nutserver && git clone https://github.com/blawar/nut .
WORKDIR /app/nutserver
VOLUME /config /games
ENV NUT_CONFIG_PATH=/config
ENV NUT_SCAN_PATH=/games
ENV NUT_SCAN_DEBOUNCE_SECONDS=30.0
CMD cd /app/nutserver && python3 ./nut.py -S
EXPOSE 9000