FROM node:7
RUN apt-get update
RUN apt-get install -y vim gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget
RUN mkdir /puppeteer
WORKDIR /puppeteer
ADD . .
RUN npm install -g puppeteer --ignore-scripts 
RUN cp Downloader.js /usr/local/lib/node_modules/puppeteer/lib
RUN cd /usr/local/lib/node_modules/puppeteer && node install.js
RUN echo 'export NODE_PATH="/usr/local/lib/node_modules:$NODE_PATH"'>>/root/.bashrc
RUN /bin/bash -c "source /root/.bashrc"
