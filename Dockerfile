FROM node:lts

WORKDIR /opt/app

ADD https://github.com/sub-store-org/Sub-Store/releases/latest/download/sub-store.bundle.js /opt/app/sub-store.bundle.js

ADD https://github.com/sub-store-org/Sub-Store-Front-End/releases/latest/download/dist.zip /opt/app/dist.zip

RUN unzip dist.zip; mv dist frontend; rm dist.zip; 

CMD mkdir -p /opt/app/data; cd /opt/app/data; SUB_STORE_FRONTEND_PATH=/opt/app/frontend SUB_STORE_DATA_BASE_PATH=/opt/app/data node /opt/app/sub-store.bundle.js


# 挂载卷就不用copy  docker run -v /opt/substore:/opt/app -p 3000:3000 -name substore node:lts
# COPY ./frontend /opt/app/frontend && COPY ./data /opt/app/data && COPY ./sub-store.bundle.js /opt/app/sub-store.bundle.js
# CMD SUB_STORE_FRONTEND_PATH=/opt/app/frontend SUB_STORE_DATA_BASE_PATH=/opt/app/data node /opt/app/sub-store.bundle.js 
# https://sub-store.vercel.app/subs?api=https://subbg-4iu3hjlo.b4a.run/
# local
# SUB_STORE_FRONTEND_PATH=./frontend SUB_STORE_DATA_BASE_PATH=./data node ./sub-store.bundle.js
# http://127.0.0.1:3001/subs?api=http://127.0.0.1:3000
EXPOSE 3000
EXPOSE 3001