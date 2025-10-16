# RA2-Tarea-repaso

1º Parte

Consideraciones:

Creación de la página.
Control de versiones y Github Actions.
Generación de documentación del código.
Creación del bucket con terraform para convertirlo, en Servidor web y despliegue de la página en él de manera automática, es decir, con Actions.
2º Parte

Podemos tener dos servidores:

Nginx
Apache2
Y dos instancias:

Amazon Linux.
Debian.
Consideraciones:

Podemos basarnos en la página anterior o crear una nueva (como siempre, control de versiones, generación de documentación....)
Todo con Actions.
Gestión del Servidor web en un contenedor usando terraform para que sea en instancias de la nube de AWS, teniendo presente:
Identificación de archivos de configuración y módulos.
Directorio en el que ubicar la página (posibilidad de cambio)
Puerto que atiende las peticiones (posibilidad de cambio)
Orden de prevalencia de la búsqueda de página web. En caso de no encontrar dicha página estudiar la opción Indexes (ventajas e inconvenientes)
Redireccionamientos.
Páginas de errores.
Negociación de contenidos, es decir, presentación de la página en distintos idiomas.
Sitios virtuales.
Autentificación de acceso a una página.
Espacio de usuarios.
Https (certificados, buscaremos una página que nos permita uno gratuito).
Análisis del tráfico del Servidor.
Un poco de imaginación por vuestra parte. Proponer algo del servidor web.