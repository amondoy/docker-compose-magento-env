FROM nginx:stable
ADD ./nginx/magento.cof /etc/nginx/conf.d/default.conf
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
