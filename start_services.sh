#!/bin/bash

# Iniciar Apache
service apache2 start

# Iniciar PHP-FPM
service php7.4-fpm start

# Mantener el contenedor en ejecución
tail -f /dev/null
