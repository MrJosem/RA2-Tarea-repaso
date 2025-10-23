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

# PUNTOS 1 POR 1

1. apache2.conf & /mods_available
2. Descomentar o cambiar ruta en la siguiente directiva: <Directory /LO_QUE_SEA/LO_QUE_SEA...>
3. ports.conf, en la directiva siguiente: Listen LO_QUE_SEA (80/443/...)
4. Ventajas: Comodidad + visualmente sencillo | Inconvenientes: Exposición de información sensible + poco seguro
5. apache2.conf, escribir la directiva siguiente: Redirect /LO_QUE_SEA/... /
   Con este ejemplo redirecciono una ruta concreta a mi index.html
6. conf-enabled/localized-error-pages.conf contiene la páginas por defecto. Para una personalizada usamos la siguiente directiva en un virtual-host: ErrorDocument 404/403/EL_QUE_SEA... /RUTA_DE_LA_PÁGINA (/error404.html sería desde el DocumentRoot, por ejemplo)
7. Crear otro virtual-host para más comodidad -> mkdir en /var/www/html/NOMBRE - Crear 3 index: index.html.es, index.html.en e index.var

- index.var
  URI: index
  URI: index.html.en
  Content-type: text/html
  Content-language: en

URI: index.html.es
Content-type: text/html
Content-language: es

Copiar archivo 000-default.conf y pegar con otro nombre. Dentro usar esta directiva:
<Directory /var/www/html/otro>
        DirectoryIndex index.var
        AddHandler type-map .var
</Directory>

Por último dentro de apache2.conf siguiente directiva para habilitar Multiviews:
<Directory /var/www/html/otro>
    Options +Multiviews
</Directory>

8. 