FROM python:3.6.2
WORKDIR /app
COPY ../app /app

RUN pip install flask

ENTRYPOINT [ "python" ]
CMD ["../app/app.py"]
