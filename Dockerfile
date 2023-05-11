FROM python:3.8

RUN pip install --upgrade pip

RUN useradd -ms /bin/bash worker
USER myuser
WORKDIR /home/myuser

COPY --chown=myuser:myuser requirements.txt requirements.txt
RUN pip install --user -r requirements.txt

ENV PATH="/home/myuser/.local/bin:${PATH}"

COPY --chown=myuser:myuser . .


# Define the entry point for the container
CMD ["flask", "run", "--host=0.0.0.0"]
