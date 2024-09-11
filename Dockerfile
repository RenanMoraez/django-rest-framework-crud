FROM python:3.6-slim

WORKDIR /usr/src/app

RUN python -m venv /usr/src/app/env

RUN /usr/src/app/env/bin/pip install --upgrade pip

COPY requirements.txt ./

RUN /usr/src/app/env/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 8000

RUN /usr/src/app/env/bin/python manage.py makemigrations && \
    /usr/src/app/env/bin/python manage.py migrate

CMD ["/usr/src/app/env/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]