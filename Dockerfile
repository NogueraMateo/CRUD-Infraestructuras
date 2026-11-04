FROM python:3.14-slim

# Dado que la imagen de python:3.14-slim no tiene el comando uv, se copian los binarios de uv desde astral-sh/uv:0.13.6 a la imagen final
COPY --from=ghcr.io/astral-sh/uv:0.13.6 /uv /uvx /bin/

WORKDIR /app

COPY pyproject.toml uv.lock ./

# Se instala la aplicación y sus dependencias en el contenedor
RUN uv sync --locked --no-dev

# Se copian los archivos de la aplicación al contenedor
COPY . .

# Se espefica al servidor que escuche en todas las intefaces de red con 0.0.0.0 y el puerto 8000
CMD ["uv", "run", "fastapi", "run", "--host", "0.0.0.0", "--port", "8000"]
