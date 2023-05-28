# fMRI-prep 
## Instalación
- Debes de instalar Docker para poder correr la imagen, Para hacerlo puedes instalarlo desde el siguiente link: https://docs.docker.com/get-docker/
- Clonar el repositorio en el git bash:
```
git clone https://github.com/EduardoMG9906/fMRI-prep
```
- Crear las imágenes necesarias para esto debes abrir un terminal (cmd o wsl2) en la ruta donde se clono el git con ruta en la carpeta /Docker:
```
docker build -t fmriprep 
```
Esto creara las imágenes necesarias para correr los contenedores.
## Licensia Free Surfer
Para poder correr FMRI-prep debes de tener la licensia de FreeSurfer la cual para obtenerla debes de llenar el siguiente formulario:
https://surfer.nmr.mgh.harvard.edu/registration.html
Despues de llenado el formulario debes de descargar el archivo y guardarlo en tu computador.
## Distribucion correcta de los archivos
- Estructurar los archivos DICOM base de la siguiente forma: 
```
raw/
├── dataset_description.json
├── participants.tsv
├── Sub-01/
│   ├── ses-1
|   |   ├── anat
|   |       ├── DICOM files (.JSON & .NIFTI)
|   |   ├── func
|   |       ├── DICOM files (.JSON & .NIFTI)
│   └── ...
└── Sub-02/
│   ├── ses-1
|   |   ├── anat
|   |       ├── DICOM files (.JSON & .NIFTI)
|   |   ├── func
|   |       ├── DICOM files (.JSON & .NIFTI)
│   └── ...
└── Sub-n/
```
Donde Sub-01 y Sub-02 son son los pacientes, ses-n se refiere al numero de la sesion de cada paciente y anat y func son las carpetas que contienen los archivos con la informacion anatomica y funcional obtenida durante la sesion.
## Uso de la imagen de FMRIprep
Despues de creada la imagen en docker y de tener organizado nuestros archivos DICOM es momento de hacer el preprocesamiento de las imagenes.
Para esto utilizamos la siguiente linea de codigo en la terminal (cmd o wsl2) en la que estamos trabajando.
```
docker run --rm -v <Ruta raw>:/data/in -v <Ruta raw>/derivatives:/data/out -v <Ruta licensia FreeSurfer>:/opt/freesurfer/license.txt fmriprep /data/in /data/out participant --participant-label 01 --fs-license-file /opt/freesurfer/license.txt
```
En este caso debes de cambiar <Ruta raw> por la ruta donde se encuentran los archivos como se especifico anteriormente.
