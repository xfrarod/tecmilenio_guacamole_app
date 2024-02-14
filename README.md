
# Examen Primer Parcial (DevOps Avanzado - IaC y seguridad)
En este examen demostraras los conocimientos adquiridos sobre el uso de Terraform para crear infraestructura. En esta ocasión utilizarás el `provider` de **Docker**.

# Instrucciones del examen

## Prerequisitos
Tener instalado **Docker Desktop** al igual que **docker-compose** y **Terraform**.

## Procedimiento
1. Deberás crear el despliegue de la aplicación mediante el uso de Terraform. El archivo `docker-compose.yaml` será tu referencia para los servicios que se despliegan.
2. Tu configuración de Terraform deberá cumplir con los siguientes requisitos
	* Configurar el provider correspondiente
	* Cada servicio deberá ser diseñado como un módulo por separado
	* Deberás hacer uso de variables y al final utilizarás un output que despliegue el URL para accesar el servicio
3. No olvides
	* Configurar apropiadamente el provider de Terraform
	* Crear una `Docker network` que se llame `guacnetwork_compose`
	* Parametrizar los módulos mediante el uso de variables de forma que puedan ser re-utilizados

## Acerca de la aplicación

Apache Guacamole es un gateway de escritorio remoto sin cliente. Admite protocolos estándar como VNC, RDP y SSH. Se denomina sin cliente porque no se requieren complementos ni software de cliente. Gracias a HTML5, una vez que Guacamole está instalado en un servidor, todo lo que necesita para acceder a su escritorio es un navegador web. La aplicación soporta RDP, SSH, Telnet and VNC. Para mayor información puedes ir a la página del proyecto [Guacamole](https://guacamole.incubator.apache.org/).

La aplicación consta de 3 microservicios:
1. guacd
2. postgres
3. guacamole

### Quick start
~~~bash
git clone  "https://github.com/xfrarod/tecmilenio_guacamole_app.git"
docker-compose up  -d
~~~
El servidor guacamole deberá estar disponible en el siguiente URL: `http://localhost:8443/guacamole`. El usuario default es `guacadmin` y la contraseña `guacadmin`.

### reset.sh
Para restablecer todo al principio, simplemente ejecute `./reset.sh`.