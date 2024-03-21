FROM python:3.11-alpine

LABEL version="0.1.0" author="user@name.com"

# RUN adduser -D my_good_user
# USER my_good_user 

WORKDIR /app
COPY . /app

RUN apk update && apk add curl
# installing rye for dependencies is good, but overkill in this case
RUN python -m pip install -r requirements.txt

EXPOSE 8080

ENTRYPOINT ["python"]
CMD ["server.py"]