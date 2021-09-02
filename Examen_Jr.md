<img src="/Users/manvicha/Xaldigital/Guidelines/encabezado.png" alt="encabezado" style="zoom:25%;" />

# Reto técnico

## Instrucciones

La siguiente prueba técnica constara de una parte dedicada a la programación y otra enfocada hacia sql. 

- *Primer reto*
    - Usar cualquier lenguaje de programación. Python o Nodejs son preferibles
    - Implementar pruebas unitarias _(Opcional)_

- *Segundo reto*
    - Realizar queries para responder una serie de preguntas

Algunas de las cosas que revisaremos del reto:

*Software en funcionamiento*. Revisaremos si la aplicación funciona tal y como se especifica en el reto
*Limpieza del código*. Esperamos que el código sea limpio, comprensible y mantenible.

### Programación
Se deberá desarrollar un proceso de análisis de datos utilizando el siguiente [enlace](https://api.stackexchange.com/2.2/search?order=desc&sort=activity&intitle=perl&site=stackoverflow). El proceso debe realizar las siguientes actividades:

1. Conectarse al enlace
1. Obtener el número de respuestas contestadas y no contestadas
1. Obtener la respuesta con mayor owners
1. Obtener la respuesta con menor número de vistas
1. Obtener la respuesta más vieja y más actual
1. Imprimir en consola del punto 2 al 5

### SQL

Se tienen las siguientes tablas que contienen información referente hacia los vuelos que se realizan en México

*Tabla de aerolíneas*

| id_aerolinea | nombre_aerolinea |
|---|---|
| 1 | Volaris |
| 2 | Aeromar |
| 3 | Interjet |
| 4 | Aeromexico |

*Tabla de aeropuertos*

| id_aeropuerto  |  nombre_aerolinea |
|---|---|
| 1 | Benito Juarez |
| 2 | Guanajuato |
| 3 | La paz |
| 4 | Oaxaca |

*Tabla de movimientos*

| id_movimiento  |  descripcion |
|---|---|
| 1 | Salida |
| 2 | Llegada |

*Tabla de vuelos*

| id_aerolinea  |  id_aeropuerto |  id_movimiento | dia |
|---|---|---|---|
| 1 | 1 | 1 | 2021-05-02 |
| 2 | 1 | 1 | 2021-05-02 |
| 3 | 2 | 2 | 2021-05-02 |
| 4 | 3 | 2 | 2021-05-02 |
| 1 | 3 | 2 | 2021-05-02 |
| 2 | 1 | 1 | 2021-05-02 |
| 2 | 3 | 1 | 2021-05-04 |
| 3 | 4 | 1 | 2021-05-04 |
| 3 | 4 | 1 | 2021-05-04 |

*Se requiere saber lo siguiente*

1. ¿Cuál es el nombre aeropuerto que ha tenido mayor movimiento durante el año?
1. ¿Cuál es el nombre aerolínea que ha realizado mayor número de vuelos durante el año?
1. ¿En qué día se han tenido mayor número de vuelos?
1. ¿Cuáles son las aerolíneas que tienen mas de 2 vuelos por día?

## Notas

Sabemos que 24 horas no es mucho tiempo, pero esperamos que hagas tu mejor esfuerzo, y recuerda que tu eres el dueño de lo que entregas y puedes decidir qué quieres y qué no quieres entregar dadas las limitaciones de tiempo.

Ten por seguro que revisaremos cuidadosamente tu reto y nos pondremos en contacto contigo lo antes posible. Te agradecemos de antemano que te postules en Xaldigital y esperamos que te diviertas haciendo este reto.

Somos una empresa de mejora continua, y queremos escuchar tus comentarios. Por favor, comparte con nosotros unas palabras sobre qué te ha parecido el reto, o si hay algo que podamos mejorar para ofrecer una buena experiencia a nuestros candidatos, ¡y para ver si podemos hacerlo mejor!

**Por favor, ten en cuenta que sólo revisaremos los proyectos que estén en Github o GitLab.**

Si tienes alguna pregunta sobre el reto, puedes enviarnos un correo electrónico a
daniel.correa@xaldigital.com o manuel.vigueras@xaldigital.com

**¡Buena suerte!**

<img src="/Users/manvicha/Xaldigital/Guidelines/mascota_lentes.png" alt="mascota_lentes" style="zoom:50%;" />
