FROM nginx:stable
ADD ./nginx/magento.conf /etc/nginx/conf.d/default.conf
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
