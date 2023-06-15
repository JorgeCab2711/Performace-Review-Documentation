# Editar valores new

[[_TOC_]]

Este flujo se utiliza para actualizar el valor y comentarios iniciales de un registro específico en la tabla de revisión de desempeño en una base de datos SQL. Primero, recibe la ID de PR, el valor, la calificación inicial y el comentario inicial a través de Power Apps y luego utiliza estos valores para actualizar el registro correspondiente en la base de datos SQL ejecutando un procedimiento almacenado.

## Power Apps V2 Action

### Descripción

Esta acción recibe un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con cuatro propiedades específicas (ID de PR, valor, calificación inicial, comentario inicial).

### Inputs

#### schema

El esquema que define las propiedades de la entrada.

##### text_1 (PR_ID)

- Tipo: String
- Descripción: ID de PR (Performance Review ID).
- Dinámicamente añadido: Sí

##### text_2 (Valor_condicionado)

- Tipo: String
- Descripción: Valor condicionado.
- Dinámicamente añadido: Sí

##### text_3 (Calificacion_inicial)

- Tipo: String
- Descripción: Calificación inicial.
- Dinámicamente añadido: Sí

##### text_4 (Comentario_Inicial)

- Tipo: String
- Descripción: Comentario inicial.
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

## Execute Procedure V2 SQL Action

### Descripción

Esta acción se utiliza para ejecutar un procedimiento almacenado en una base de datos SQL que actualiza el valor y los comentarios iniciales de un registro específico en la tabla de revisión de desempeño.

### Inputs

#### host

Configuración del servidor SQL donde se ejecutará el procedimiento almacenado.

##### connectionName

- Valor: shared_sql
- Descripción: Nombre de la conexión a utilizar.

##### operationId

- Valor: ExecuteProcedure_V2
- Descripción: Identificador de la operación para ejecutar un procedimiento almacenado.

##### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_sql
- Descripción: Identificador de la API para PowerApps.

#### parameters

##### server

- Valor: default
- Descripción: Servidor SQL donde se ejecutará el procedimiento almacenado.

##### database

- Valor: default
- Descripción: Base de datos SQL donde se ejecutará el procedimiento almacenado.

##### procedure

- Valor: [dbo].[updateValorRowInit]
- Descripción: Nombre del procedimiento almacenado que se ejecutará.

##### parameters/PR_ID

- Valor: @triggerBody()['text_1']
- Descripción: ID de PR que se actualizará.

##### parameters/Valor

- Valor: @triggerBody()['text_2']
- Descripción: Valor que se actualizará.

##### parameters/Calificacion

- Valor: @triggerBody()['text_3']
- Descripción: Calificación inicial que se actualizará.

##### parameters/Comentario

- Valor: @triggerBody()['text_4']
- Descripción: Comentario inicial que se actualizará.

#### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
