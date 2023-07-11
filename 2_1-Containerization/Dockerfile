FROM nginx:alpine
ENV BACKEND_URL=$BACKEND_URL
COPY --chown=nginx:nginx ./nginx.conf /etc/nginx/nginx.conf
COPY --chown=nginx:nginx ./default.conf /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx ./index.html /usr/share/nginx/html/index.html
COPY --chown=nginx:nginx ./50x.html /usr/share/nginx/html/50x.html
COPY --chown=nginx:nginx ./nginx.crt /etc/nginx/ssl/nginx.crt
COPY --chown=nginx:nginx ./nginx.key /etc/nginx/ssl/nginx.key
RUN chmod 400 /etc/nginx/ssl/*
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]