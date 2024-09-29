Deepin Backup Tool Tutorial / Tutorial de la Herramienta de Respaldo de Deepin

Welcome to the Deepin Backup Tool tutorial! This guide will walk you through installing and using the tool to back up your important files effortlessly.
¡Bienvenido al tutorial de la Herramienta de Respaldo de Deepin! Esta guía te llevará a través de la instalación y uso de la herramienta para respaldar tus archivos importantes de manera sencilla.
Table of Contents / Tabla de Contenidos

    Overview / Descripción General
    Prerequisites / Requisitos Previos
    Installation / Instalación
    Configuring rclone / Configuración de rclone
    Configuration / Configuración
    Running the Backup / Ejecutando el Respaldo
    Verifying Backups / Verificando Respaldos
    Customization / Personalización
    Troubleshooting / Solución de Problemas
    Contributing / Contribuciones

Overview / Descripción General

The Deepin Backup Tool automates the backup process for Deepin users by:
La Herramienta de Respaldo de Deepin automatiza el proceso de respaldo para los usuarios de Deepin al:

    Syncing essential directories (Documents, Pictures, Downloads) with rsync. (user can add any folder)
    Sincronizar directorios esenciales (Documentos, Imágenes, Descargas) con rsync. (EL usuario puede agregar cualquier carpeta)
    Compressing the backups into .tar.gz files.
    Comprimir los respaldos en archivos .tar.gz.
    Uploading the backups to cloud storage using rclone.
    Subir los respaldos a la nube utilizando rclone.

Prerequisites / Requisitos Previos

Before you begin, ensure that you have the following installed:
Antes de comenzar, asegúrate de tener lo siguiente instalado:

    Deepin OS: This tool was tested on deepin, but it should work on any linux distro.
    Deepin OS: Esta herramienta fue testeada en deepin, pero deberia funcionar en cualquier distro linux

    rsync: Usually pre-installed on Deepin. Check by running rsync --version in the terminal.
    rsync: Usualmente preinstalado en Deepin. Verifica ejecutando rsync --version en la terminal.

    tar: Also pre-installed. Check with tar --version.
    tar: También preinstalado. Verifica con tar --version.

    rclone: If not installed, you can install it using:
    rclone: Si no está instalado, puedes instalarlo usando:

    bash

    sudo apt update
    sudo apt install rsync tar rclone cron -y

Installation / Instalación

    Clone the Repository:
    Open a terminal and run the following command to clone the repository:
    Clonar el Repositorio: Abre una terminal y ejecuta el siguiente comando para clonar el repositorio:

    bash

git clone https://github.com/deepinecuadorteam/lateam-backup-tool.git

Navigate to the Directory:
Change to the directory where the script is located:
Navegar al Directorio: Cambia al directorio donde se encuentra el script:

bash

cd lateam-backup-tool

Make the Script Executable:
Run the following command to make the script executable:
Hacer el Script Ejecutable: Ejecuta el siguiente comando para hacer el script ejecutable:

bash

    chmod +x deepinlatbackup.sh

Configuring rclone / Configuración de rclone

Before using the backup tool, you need to configure rclone to connect to your cloud storage:
Antes de usar la herramienta de respaldo, necesitas configurar rclone para conectarte a tu almacenamiento en la nube:

    Run rclone Configuration:
    In the terminal, run:
    Ejecutar Configuración de rclone: En la terminal, ejecuta:

    bash

    rclone config

    Create a New Remote:
        Choose n to create a new remote.
        Enter a name for your remote (e.g., myclone).
        Crear un Nuevo Remoto:
        Elige n para crear un nuevo remoto.
        Ingresa un nombre para tu remoto (por ejemplo, myclone).

    Select Cloud Storage Type:
    Choose the type of cloud storage you want to use (e.g., Google Drive, Dropbox, etc.) by selecting the corresponding number from the list.
    Seleccionar Tipo de Almacenamiento en la Nube: Elige el tipo de almacenamiento en la nube que deseas usar (por ejemplo, Google Drive, Dropbox, etc.) seleccionando el número correspondiente de la lista.

    Configure OAuth Credentials:
    Follow the prompts to enter your client_id and client_secret if required. If you're unsure, you can usually leave these blank.
    Configurar Credenciales de OAuth: Sigue las indicaciones para ingresar tu client_id y client_secret si es necesario. Si no estás seguro, generalmente puedes dejar estos campos en blanco.

    Authorize rclone:
    When prompted, you may need to follow a URL to authorize rclone to access your cloud storage. Copy the authorization code back into the terminal.
    Autorizar rclone: Cuando se te pida, es posible que necesites seguir una URL para autorizar a rclone a acceder a tu almacenamiento en la nube. Copia el código de autorización de vuelta en la terminal.

    Finish Configuration:
    Follow the remaining prompts to finish the configuration. You should see a confirmation message once complete.
    Finalizar Configuración: Sigue las indicaciones restantes para finalizar la configuración. Deberías ver un mensaje de confirmación una vez que esté completo.

Configuration / Configuración

Before running the tool, you may want to configure the backup settings in the script:
Antes de ejecutar la herramienta, es posible que desees configurar los ajustes de respaldo en el script:

    Edit the Script:
    Open the script in a text editor:
    Editar el Script: Abre el script en un editor de texto:

    bash

    nano deepinlatbackup.sh

    Adjust Backup Source Directories:
    Ensure the directories listed in the BACKUP_SOURCE variable include all the directories you wish to back up.
    Ajustar Directorios de Origen del Respaldo: Asegúrate de que los directorios listados en la variable BACKUP_SOURCE incluyan todos los directorios que deseas respaldar.

    Set the Backup Destination:
    Modify BACKUP_DEST to your preferred backup location. The default is set to /home/Owens/backups.
    Establecer la Destinación del Respaldo: Modifica BACKUP_DEST a tu ubicación preferida de respaldo. El valor por defecto es /home/Owens/backups.

    Configure rclone:
    Ensure you have set up rclone and configured the remote storage you want to use. Replace myclone in RCLONE_REMOTE with your rclone remote name.
    Configurar rclone: Asegúrate de haber configurado rclone y el almacenamiento remoto que deseas usar. Reemplaza myclone en RCLONE_REMOTE con el nombre de tu remoto de rclone.

Running the Backup / Ejecutando el Respaldo

    Execute the Script:
    In the terminal, run the script to start the backup process:
    Ejecutar el Script: En la terminal, ejecuta el script para comenzar el proceso de respaldo:

    bash

    ./deepinlatbackup.sh

    Monitor Progress:
    You will see messages indicating the progress of the backup, including syncing, compressing, and uploading to the cloud.
    Monitorear el Progreso: Verás mensajes que indican el progreso del respaldo, incluyendo sincronización, compresión y carga a la nube.

    Completion Message:
    Once the backup is complete, you will see a confirmation message.
    Mensaje de Finalización: Una vez que el respaldo esté completo, verás un mensaje de confirmación.

Verifying Backups / Verificando Respaldos

To verify that your backups were successful, check the following:
Para verificar que tus respaldos fueron exitosos, verifica lo siguiente:

    Local Backup: Navigate to your specified backup directory (`/home/O
