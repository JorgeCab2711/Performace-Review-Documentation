# Documentación de la Aplicación Performance Review

## Descripción General
La aplicación Performance Review 2.0 ha sido diseñada para ayudar a los colaboradores y jefes de Grupo Sega en el proceso de evaluación de desempeño. Los colaboradores pueden realizar autoevaluaciones de sus valores y objetivos, mientras que los jefes tienen la capacidad de evaluar los Performance Review de los colaboradores a su cargo, así como comentar acerca de las calificaciones y visualizar los resultados generales.

## Descripción de lógica

Una auto evaluación tiene como objetivo principal evaluar el desempeño de los colaboradores de la empresa. Cada auto evaluación tiene un periodo de tiempo , usalmente un periodo dura 6 meses. Los usuarios, al iniciar un ***PR*** (Performance Review) ingresarán las fechas de inicio y fin de su PR. Al terminar este, los datos no se borrarán pero tampoco se mostrarán al usuario. Solamente un usuario Jefe podrá verlos resultados de PR anteriores.

A lo largo de esta aplicación en varias pantallas se podrá ver que varios de los componentes en los que van títulos y párrafos se usan como componetes botones deshabilitados. Se tomón esta decisión debido a que el componente es uno de los más personalizables visualmente, algunas de las propiedades visuales de un botón simplemente no están disponibles en componentes como los ***Label***, así como la propiedad de radio de los bordes y esquinas.

___
## Instrucciones de Instalación

### Usuarios

1. Asegúrate de tener acceso a internet y un navegador web.
2. Accede a la aplicación de Grupo Sega en Power Apps a través del siguiente enlace: [URL de la aplicación](https://login.microsoftonline.com/cbaa3072-e5ea-485f-8072-51a0a0bee5f7/oauth2/v2.0/authorize?client_id=3e62f81e-590b-425b-9531-cad6683656cf&scope=https%3a%2f%2fservice.powerapps.com%2f%2f.default+openid+profile+offline_access&redirect_uri=https%3a%2f%2fapps.powerapps.com%2fauth%2fv2&client-request-id=23c1db68-3cc9-4fb2-912c-609aa9e7752e&response_mode=fragment&response_type=code&x-client-SKU=msal.js.browser&x-client-VER=2.18.0&x-client-OS=&x-client-CPU=&client_info=1&code_challenge=KgPzpBDRww8aTi8nNYT-ibum4QqtFz2VlPYkiU0YTRM&code_challenge_method=S256&nonce=375a83bc-b86e-4746-a35e-157e005baaeb&state=eyJpZCI6Ijk4Y2I5NzU1LTUxNTAtNGJiNS04NzA1LTg1ZDI2NjAyYTViZCIsIm1ldGEiOnsiaW50ZXJhY3Rpb25UeXBlIjoicmVkaXJlY3QifX0%3d&sso_nonce=AwABAAEAAAACAOz_BQD0_yiIjg_scW6qyvePOcK-MrBggMQKkNELSQ7cEBjJKljBTuwL7zrCTjNlyxUJ51uueWNYWSzEdIXc5Z9T-G0E-FMgAA&mscrid=23c1db68-3cc9-4fb2-912c-609aa9e7752e). Este URL puede variar dependiendo del deployment de la app.
3. Inicia sesión con tus credenciales de Grupo Sega para acceder a la aplicación Performance Review.

### Desarrolladores

1. Obtén los permisos necesarios para editar la aplicación. Consulta con tu jefe o encargado para obtener estos permisos.
2. Asegúrate de tener acceso a la base de datos "srvgtsql1 - planillas" y las tablas PerformanceReview, PerfReviewValores y PerfReviewObjetivos para realizar cambios en la aplicación.
___
## Division de Pantallas

La aplicación Performance Review se compone de las siguientes pantallas:

1. **PR-HomeScreen_new:** Pantalla de inicio que muestra una visión general de la aplicación y proporciona opciones de navegación.

2. **Valores Corporativos Colaborador_new:** Pantalla donde los colaboradores pueden realizar la autoevaluación de sus valores corporativos.

3. **Valores Corporativos Colaborador 2_new:** Pantalla adicional para la autoevaluación de valores corporativos de los colaboradores.

4. **Indicadores de Negocio Colaborador_new:** Pantalla donde los colaboradores pueden evaluar los indicadores de negocio relacionados con su desempeño.

5. **Datos Valores:** Pantalla que muestra los datos relacionados con los valores corporativos.

6. **Edit_valores_inicoi_new:** Pantalla de edición para la configuración inicial de los valores corporativos.

7. **Edit valores fin 2_new:** Pantalla de edición para la configuración final de los valores corporativos.

8. **Admin Screen Jefe new:** Pantalla destinada a los jefes, donde pueden evaluar y comentar los Performance Review de los colaboradores a su cargo.

9. **Resultados new:** Pantalla que muestra los resultados generales de las evaluaciones de desempeño.

___


## Notas importantes:

A lo largo de la documentación se menciona que se usaron botones como labels, para agregar texto y darle un style más amigable. Esto se hizo principalmente porque el componente _label_ no tiene todas las opciones de personalización que tienen los botones a la fecha de desarrollo de la aplicación **(Marzo-Mayo 2023)**.

___
## Contacto de soporte
Esta app fue desarrollada por Jorge Caballeros. Actualmente trabajando como practicante en Grupo sega a la fecha de la publicación de esta documentación. Con cualquier duda, sugerencia, o reporte de errores porfavor comunicarse al correo jorgeca@gruposega.net . 