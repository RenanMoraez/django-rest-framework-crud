FROM python:3.6-slim

WORKDIR /usr/src/app

RUN python -m venv /usr/src/app/env

RUN /usr/src/app/env/bin/pip install --upgrade pip

COPY requirements.txt ./

RUN /usr/src/app/env/bin/pip install --no-cache-dir -r requirements.txt

COPY . .

RUN /usr/src/app/env/bin/pip install httpie

EXPOSE 8000

CMD ["/usr/src/app/env/bin/python", "manage.py", "runserver", "0.0.0.0:8000"]


