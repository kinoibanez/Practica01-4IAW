# Practica01-4IAW
Este repositorio es para la Práctica 1 apartado 4 de IAW

## Primer paso.

- Tendremos que copiar una serie de archivos de la otra práctica para el funcionamiento de esta. Tambien tendremos que crear un script nuevo.

- El .env también lo copiamos y pero tiene que estar vacio debido a que deberemos de cambiarlo en un futuro.

- Los directorios que tenemos que tener creados para empezar son los siguientes:

 ![](images/cap1.png)


## Configuramos el nuevo script junto con las nuevas variables.

- El nuevo script que tenemos que crear se llama *_setup_selfsigned_certificate.sh_*

- Como primer paso tendremos que añadir la siguiente linea para crear un certificado y una clave primaria.

- `sudo openssl req \ `
  `-x509 \ `
  `-nodes \ `
  `-days 365 \ `
  `-newkey rsa:2048 \ `
  `-keyout /etc/ssl/private/apache-selfsigned.key \ `
  `-out /etc/ssl/certs/apache-selfsigned.crt` 

- Y después en *_.env_* añadimos las variables con los nombres que queramos poner:

    ![](images/cap2.png)

- Si todo funciona correctamente podremos hacer un *_cat_* de las rutas que hemos añadido anteriormente y veremos que esta creada la clave privada y el certificado.


## Configuramos un nuevo archiv .conf

- Tenemos que crear un nuevo archivo de configuración llamado _default-ssl.conf_ donde tendremos que añadir en su interior la siguiente configuración:

- ![](images/cap4.png)

- Si esta bien creado, si hacemos un *_cat_* de la ruta nos debería de salir la configuracion de la siguiente manera:

- ![](images/cap5.png)

- Si accedemos a nuestra ip de manera remota podemos ver 


Cambiar permisos y dar control total para poder accewder a al ip y al archivo para poder modificarlo. 
c:\Windows\System32\Drivers\etc\hosts.
44.205.86.33	practicaiaw.local