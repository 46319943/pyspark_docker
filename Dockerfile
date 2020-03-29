ARG BASE_CONTAINER=jupyter/pyspark-notebook
FROM $BASE_CONTAINER

ENV SPARK_CLASSPATH=/home/jovyan/postgresql-42.2.11.jar \
	PYSPARK_DRIVER_PYTHON_OPTS="notebook" \
	PYSPARK_DRIVER_PYTHON=jupyter

RUN cd ~ && \
	wget https://jdbc.postgresql.org/download/postgresql-42.2.11.jar
	
ENTRYPOINT ["pyspark", "--driver-class-path", "/home/jovyan/postgresql-42.2.11.jar"]