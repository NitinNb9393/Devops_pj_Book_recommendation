FROM python:3.10-slim
 
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

WORKDIR /app

# ⬅️ This line copies ALL files and folders into /app, including src/
COPY . .

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
 && pip install --no-cache-dir -r requirements.txt \
 && apt-get purge -y build-essential \
 && apt-get autoremove -y \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

EXPOSE 8501

CMD ["streamlit", "run", "app.py"]
