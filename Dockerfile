# Usamos una imagen base ligera de Node
FROM node:lts-alpine3.19

# Crear directorio de la aplicación
RUN mkdir -p /home/app

# Establecer directorio de trabajo
WORKDIR /home/app

# Copiar los archivos de dependencias primero (optimiza cache de Docker)
COPY package*.json ./

# Instalar dependencias
RUN npm install

# Copiar el resto del proyecto
COPY . .

# Exponer el puerto 3000
EXPOSE 3000

# Comando para ejecutar la app
CMD ["node", "index.js"]
# Nota: Asegúrate de que 'index.js' es el archivo de entrada correcto de tu aplicación.