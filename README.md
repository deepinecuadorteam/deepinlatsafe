🔄 Backup Script Tutorial (English & Spanish)

This tutorial will walk you through the process of using our backup script for automating local and cloud backups on Linux. The script is designed for Deepin users but can be adapted for any Linux distribution.

Features:

Create backups of important folders.
Optional encryption using AES-256.
Upload backups to the cloud using rclone.

📋 Usage Instructions (English)
1. Clone or Download the Script:

First, clone the script from the GitHub repository or download it directly.

bash

    git clone [https://github.com/your-username/backup-script.git](https://github.com/deepinecuadorteam/deepinlatsafe)
    cd deepinlatsafe
    chmod +x deepinlatsafe.sh

2. Run the Script:

To run the script, open your terminal, navigate to the directory where the script is located, and execute it:

bash

    ./deepinlatsafe.sh

3. Choose Backup Type:

You will be prompted to choose where to store your backup:

    Option 1: Local storage
    Option 2: Cloud storage (using rclone)

Simply type 1 for local or 2 for cloud and press Enter.
4. Encryption (Optional):

You will also be asked if you want to encrypt the backup. If you choose yes, you will need to provide a password.
5. Cloud Backup (if chosen):

If you select cloud backup, ensure that you have rclone installed and configured. You can configure it by running:

bash

    rclone config

Once the backup is created, it will automatically upload to the specified cloud remote.
⚙️ Customizing the Script (English)
Adding or Removing Folders to Backup:

The folders to be backed up are defined in the BACKUP_SOURCE array within the script. You can easily add or remove directories to customize your backup.
Example:

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures" "/home/$USER/Downloads")

To Add a Folder:

Simply append the desired directory to the array.

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures" "/home/$USER/Downloads" "/home/$USER/Videos")

To Remove a Folder:

Just remove the folder path from the array.

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures")

📋 Instrucciones de Uso (Español)
1. Clona o Descarga el Script:

Primero, clona el script desde el repositorio de GitHub o descárgalo directamente.

bash

    git clone [https://github.com/your-username/backup-script.git](https://github.com/deepinecuadorteam/deepinlatsafe)
    cd deepinlatsafe
    chmod +x deepinlatsafe.sh

2. Ejecuta el Script:

Para ejecutar el script, abre tu terminal, navega al directorio donde está ubicado el script y ejecútalo:

bash

    ./deepinlatsafe.sh

3. Elige el Tipo de Respaldo:

Se te pedirá que elijas dónde deseas almacenar tu respaldo:

    Opción 1: Almacenamiento local
    Opción 2: Almacenamiento en la nube (usando rclone)

Simplemente escribe 1 para local o 2 para la nube y presiona Enter.
4. Encriptación (Opcional):

También se te preguntará si deseas encriptar el respaldo. Si eliges yes, deberás proporcionar una contraseña.
5. Respaldo en la Nube (si lo seleccionaste):

Si seleccionas respaldo en la nube, asegúrate de tener rclone instalado y configurado. Puedes configurarlo ejecutando:

bash

rclone config

Una vez que el respaldo esté creado, se subirá automáticamente a la nube especificada.
⚙️ Personalización del Script 
Añadir o Eliminar Carpetas para Respaldar:

Las carpetas a respaldar están definidas en la variable BACKUP_SOURCE dentro del script. Puedes añadir o eliminar directorios fácilmente para personalizar tu respaldo.
Ejemplo:

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures" "/home/$USER/Downloads")

Para Añadir una Carpeta:

Simplemente añade el directorio deseado al arreglo.

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures" "/home/$USER/Downloads" "/home/$USER/Videos")

Para Eliminar una Carpeta:

Solo elimina la ruta de la carpeta del arreglo.

bash

    BACKUP_SOURCE=("/home/$USER/Documents" "/home/$USER/Pictures")


💻 Contributing to the Project / Contribuye al Proyecto 🌍

We warmly welcome contributions from the community! Whether you're a seasoned developer, a passionate Linux user, or someone new looking to make a difference, your input is invaluable to this project. 
Feel free to contribute by:

    Adding new features 🆕
    Fixing bugs 🐞
    Improving the documentation 📖
    Translating the script/tutorial into other languages 🌐
