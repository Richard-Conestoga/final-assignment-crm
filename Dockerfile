FROM python:3.12-alpine

WORKDIR /app

COPY django-crm/requirements.txt .

RUN apk add --no-cache mariadb-connector-c \
    && apk add --no-cache --virtual .build-deps gcc g++ musl-dev mariadb-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps

COPY django-crm .
COPY settings.py /app/webcrm/settings.py

# Start app
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8080"]
#CMD ["tail", "-f", "/dev/null"]