FROM python:3.8

WORKDIR /code

COPY . .

ENV CSV_FILENAME="data.csv"
ENV POSTGRES_USER="postgres"
ENV POSTGRES_PASSWORD="yolo57"
ENV POSTGRES_DB="postgres"

RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P .
RUN chmod +x ./wait-for-it.sh
ENTRYPOINT ["./wait-for-it.sh", "db:5432", "--"]

RUN pip install --upgrade pip
RUN pip install psycopg2

CMD ["python", "-m", "manager"] 