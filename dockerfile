FROM nipreps/fmriprep:latest

# Opcional: Si necesitas añadir dependencias adicionales, puedes hacerlo aquí.
# RUN apt-get update && apt-get install -y <nombre_del_paquete>

# Opcional: Si necesitas copiar archivos adicionales al contenedor, puedes hacerlo aquí.
# COPY <archivo_fuente> <directorio_destino>

# Comando predeterminado que se ejecutará cuando se inicie el contenedor.
CMD ["fmriprep"]