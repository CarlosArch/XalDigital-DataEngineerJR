from urllib import request
import gzip
import json
from datetime import datetime

url = 'https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow'
with request.urlopen(url) as respuesta_http:
    # print(respuesta_http.headers)

    # El contenido de la respuesta son datos en formato JSON comprimidos con codificación utf-8
    datos = respuesta_http.read()
    datos = gzip.decompress(datos)
    datos = datos.decode('utf-8')
    datos = json.loads(datos)

    contestados = sum([hilo['is_answered'] for hilo in datos['items']])
    no_contestados = sum([not hilo['is_answered'] for hilo in datos['items']])

    hilos_y_visitas = {hilo['title'] : hilo['view_count'] for hilo in datos['items']}
    hilo_menos_visitado = min(hilos_y_visitas, key=hilos_y_visitas.get)

    hilos_y_fecha = {hilo['title'] : hilo['creation_date'] for hilo in datos['items']}
    hilo_más_nuevo = max(hilos_y_fecha, key=hilos_y_fecha.get)
    hilo_más_viejo = min(hilos_y_fecha, key=hilos_y_fecha.get)

    print('Hilos con respuestas:', contestados)
    print('Hilos sin respuestas:', no_contestados)
    print(f'Hilo con menos visitas: "{hilo_menos_visitado}" con {hilos_y_visitas[hilo_menos_visitado]} visitas')
    print(f'Hilo más nuevo: "{hilo_más_nuevo}" creado el {datetime.utcfromtimestamp(hilos_y_fecha[hilo_más_nuevo])}')
    print(f'Hilo más viejo: "{hilo_más_viejo}" creado el {datetime.utcfromtimestamp(hilos_y_fecha[hilo_más_viejo])}')

    # hilo_menos_visitado = datos['items']
