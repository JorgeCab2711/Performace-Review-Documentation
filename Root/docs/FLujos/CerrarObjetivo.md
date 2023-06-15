# Cerrar Objetivo

[[_TOC_]]

## Power Apps V2 Action

### Descripción

Esta acción se utiliza para definir un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con propiedades específicas.

### Inputs

#### schema

El esquema que define las propiedades de la entrada.

##### text (PR_ID_OBJ)

- Tipo: String
- Descripción: Por favor, introduzca la ID del OBJETIVO de la revisión de desempeño (PR).
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

## Patch Row V2 SQL Action

### Descripción

Esta acción se utiliza para actualizar una fila existente en una tabla de base de datos SQL. Utiliza los valores de las propiedades proporcionadas en la entrada para actualizar la fila.

### Inputs

#### host

Configuración del servidor SQL donde se actualizará la fila.

##### connectionName

- Valor: shared_sql
- Descripción: Nombre de la conexión a utilizar.

##### operationId

- Valor: PatchItem_V2
- Descripción: Identificador de la operación para actualizar un elemento.

##### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_sql
- Descripción: Identificador de la API para PowerApps.

#### parameters

##### server

- Valor: default
- Descripción: Servidor SQL donde se actualizará la fila.

##### database

- Valor: default
- Descripción: Base de datos SQL donde se actualizará la fila.

##### table

- Valor: [dbo].[PerfReview_Objectives]
- Descripción: Nombre de la tabla en la que se actualizará la fila.

##### id

- Valor: @triggerBody()['text']
- Descripción: ID del objetivo de la revisión de desempeño que se actualizará.

##### item/Firmado

- Valor: false
- Descripción: Estado de la firma de la revisión de desempeño.

##### item/Cerrado_colaborador

- Valor: true
- Descripción: Indica si el objetivo ha sido cerrado por el colaborador.

#### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
