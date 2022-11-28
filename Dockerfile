FROM ubuntu::latest

LABEL maintainer=”Sistemas Operacionais” .
RUN apt_get update && apt_get upgrade -y
EXPOSE 80
CMD ["nginx","-g","daemon off;"]