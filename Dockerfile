#images of nginx
FROM docker.io/centos:centos6
RUN yum install -y pcre-devel wget net-tools gcc zlib zlib-devel make openssl-devel
RUN useradd -M -s /sbin/nologin nginx
ADD http://nginx.org/download/nginx-1.6.2.tar.gz .
RUN tar zxvf nginx-1.6.2.tar.gz
RUN mkdir -p /usr/local/nginx
RUN cd nginx-1.6.2 && ./configure --prefix=/usr/local/nginx --user=nginx --group=nginx --with-http_stub_status_module && make && make install
RUN ln -s /usr/local/nginx/sbin/* /usr/local/sbin/
copy nginx.conf /usr/local/nginx/conf/nginx.conf
expose 80
CMD ["nginx"]