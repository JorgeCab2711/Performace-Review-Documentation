# Editar objetivo Colaborador 

[[_TOC_]]

Este flujo se utiliza para modificar un objetivo existente en la tabla de objetivos de revisión de desempeño en una base de datos SQL. Primero, recibe la ID del objetivo y el nuevo objetivo a través de Power Apps y luego utiliza estos valores para actualizar la fila correspondiente en la base de datos SQL.

## Power Apps V2 Action

### Descripción

Esta acción recibe un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con dos propiedades específicas (ID del objetivo de revisión de desempeño y el nuevo objetivo).

### Inputs

#### schema

El esquema que define las propiedades de la entrada.

##### text (PR_ID_OBJ)

- Tipo: String
- Descripción: Por favor, introduce la ID del objetivo de la revisión de desempeño (Objective's PR ID).
- Dinámicamente añadido: Sí

##### text_1 (new_objective_mod)

- Tipo: String
- Descripción: Por favor, introduce el nuevo objetivo.
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

## Patch Row V2 SQL Action

### Descripción

Esta acción se utiliza para actualizar una fila existente en una tabla de base de datos SQL. Utiliza el valor de ID proporcionado en la entrada junto con el nuevo objetivo para actualizar la fila correspondiente.

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
- Descripción: ID del objetivo de revisión de desempeño que se actualizará.

##### item/IndicadorNegocio

- Valor: @triggerBody()['text_1']
- Descripción: Nuevo objetivo que se actualizará.

#### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
