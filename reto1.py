from urllib import request
import gzip
import json
from datetime import datetime

url = 'https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow'

# 1. Conectarse al enlace
with request.urlopen(url) as respuesta_http:
    # print(respuesta_http.headers)
    # El contenido de la respuesta son datos en formato JSON comprimidos con codificación utf-8
    datos = respuesta_http.read()
    datos = gzip.decompress(datos)
    datos = datos.decode('utf-8')
    datos = json.loads(datos)

    hilos = datos['items']
    # 2. Obtener el número de respuestas contestadas y no contestadas

    respondidos = [hilo['is_answered'] for hilo in hilos]
    contestados = sum(respondidos)
    no_contestados = len(respondidos) - contestados

    # 3. Obtener la respuesta con mayor reputación del owner
    owners_y_reputacion = {hilo['owner']['display_name'] : hilo['owner']['reputation'] for hilo in hilos}
    owner_con_mayor_reputacion = max(owners_y_reputacion, key=owners_y_reputacion.get)

    # 4. Obtener la respuesta con menor número de vistas
    hilos_y_visitas = {hilo['title'] : hilo['view_count'] for hilo in hilos}
    hilo_menos_visitado = min(hilos_y_visitas, key=hilos_y_visitas.get)

    # 5. Obtener la respuesta más vieja y más actual
    hilos_y_fecha = {hilo['title'] : hilo['creation_date'] for hilo in hilos}
    hilo_más_nuevo = max(hilos_y_fecha, key=hilos_y_fecha.get)
    hilo_más_viejo = min(hilos_y_fecha, key=hilos_y_fecha.get)

    # 6. Imprimir en consola del punto 2 al 5
    print('Hilos con respuestas:', contestados)
    print('Hilos sin respuestas:', no_contestados)
    print(f'Owner con mayor reputación: {owner_con_mayor_reputacion} con {owners_y_reputacion[owner_con_mayor_reputacion]} de reputación')
    print(f'Hilo con menos visitas: "{hilo_menos_visitado}" con {hilos_y_visitas[hilo_menos_visitado]} visitas')
    print(f'Hilo más nuevo: "{hilo_más_nuevo}" creado el {datetime.utcfromtimestamp(hilos_y_fecha[hilo_más_nuevo])}')
    print(f'Hilo más viejo: "{hilo_más_viejo}" creado el {datetime.utcfromtimestamp(hilos_y_fecha[hilo_más_viejo])}')
