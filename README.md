# API de gestión de usuarios de Wow y personajes creados

Este repositorio contiene una API simple creada con Express.js para gestionar personajes y usuarios en una base de datos MySQL.

## Estructura de la base de datos

En la carpeta `db`, encontrarás un archivo `wowdb.sql` que contiene la estructura de la base de datos y datos de ejemplo para comenzar. Asegúrate de importar este archivo en tu sistema MySQL para tener las tablas y datos necesarios para el funcionamiento de la API.

## Requisitos

- Node.js instalado en tu sistema.
- Acceso a una base de datos MySQL.

## Instalación

1. Clona este repositorio en tu ordenador.
2. Ejecuta `npm install` para instalar todas las dependencias necesarias.
3. Crea un archivo `.env` en la raíz del proyecto con la configuración de tu base de datos:

HOST=tu_host_de_DB
DBUSER=tu_usuario_DB
PASS=contraseña_de_DB
DATABASE=nombre_de_la_DB 


## Uso

1. Ejecuta `npm run dev` para iniciar el servidor en el puerto 1212 (puedes cambiar el puerto en el archivo `index.js` si es necesario).
2. Accede a la API a través de las siguientes rutas:

### Personajes

- **GET `/`**: Obtiene la relación entre personajes y usuarios con algunos datos de cada uno.
- **GET `/characters`**: Obtiene todos los personajes almacenados.
- **GET `/characters/:id`**: Obtiene un personaje específico por su ID.
- **POST `/characters`**: Agrega un nuevo personaje.
- **PUT `/characters/:id`**: Actualiza un personaje existente por su ID.
- **DELETE `/characters/:id`**: Elimina un personaje por su ID.

### Usuarios

- **GET `/users`**: Obtiene todos los usuarios almacenados.
- **POST `/users`**: Registra un nuevo usuario.
- **POST `/users/login`**: Loguear con un usuario específico.
- **DELETE `/users/:id`**: Elimina un usuario por su ID.

## Tecnologías Utilizadas

- Express.js: Framework para construir la API.
- MySQL: Sistema de gestión de base de datos.
- bcrypt: Para el hash de contraseñas de usuarios.
- jsonwebtoken: Para la autenticación y autorización de usuarios.

## Contribución

Siéntete libre de contribuir con nuevas características, mejoras o reportar problemas abriendo un issue en este repositorio.

