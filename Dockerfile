# Imagen base con sistema operativo Alpine versión 3.14.
FROM public.ecr.aws/docker/library/alpine:3.14

# Instalación de Python 3 y pip en el sistema operativo.
RUN apk add py3-pip \ 
    && pip install --upgrade pip

# Creación del directorio de trabajo dentro del sistema.
WORKDIR /app

# Copia todos los archivos de la aplicación al directorio de trabajo.
COPY . /app/

# Instalación de las dependencias de la aplicación desde el archivo requirements.txt.
RUN pip install -r src/requirements.txt

# Exposición del puerto 5000 para que la aplicación pueda recibir tráfico.
EXPOSE 5000

# Comando para ejecutar la aplicación Python al iniciar el contenedor.
CMD ["python3", "src/application.py"]
