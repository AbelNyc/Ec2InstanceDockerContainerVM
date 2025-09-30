FROM python:3.8-slim
RUN pip install flask
COPY app.py /app.py
CMD ["python", "app.py"]
