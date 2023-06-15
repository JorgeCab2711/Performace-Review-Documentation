# Eliminar Objetivo Colaborador


[[_TOC_]]

Este flujo se utiliza para eliminar un objetivo específico de la tabla de objetivos de revisión de desempeño en una base de datos SQL. Primero, recibe la ID del objetivo a través de Power Apps y luego utiliza esta ID para eliminar la fila correspondiente en la base de datos SQL.

## Power Apps V2 Action

### Descripción

Esta acción recibe un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con una propiedad específica (ID del objetivo de revisión de desempeño).

### Inputs

#### schema

El esquema que define las propiedades de la entrada.

##### text (OBJ_PR_ID)

- Tipo: String
- Descripción: Introduce la ID del objetivo de revisión de desempeño (Objective PR ID).
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

## Delete Row V2 SQL Action

### Descripción

Esta acción se utiliza para eliminar una fila en una tabla de base de datos SQL. Utiliza el valor de ID proporcionado en la entrada para eliminar la fila correspondiente.

### Inputs

#### host

Configuración del servidor SQL donde se eliminará la fila.

##### connectionName

- Valor: shared_sql
- Descripción: Nombre de la conexión a utilizar.

##### operationId

- Valor: DeleteItem_V2
- Descripción: Identificador de la operación para eliminar un elemento.

##### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_sql
- Descripción: Identificador de la API para PowerApps.

#### parameters

##### server

- Valor: default
- Descripción: Servidor SQL donde se eliminará la fila.

##### database

- Valor: default
- Descripción: Base de datos SQL donde se eliminará la fila.

##### table

- Valor: [dbo].[PerfReview_Objectives]
- Descripción: Nombre de la tabla en la que se eliminará la fila.

##### id

- Valor: @triggerBody()['text']
- Descripción: ID del objetivo de revisión de desempeño que se eliminará.

#### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
