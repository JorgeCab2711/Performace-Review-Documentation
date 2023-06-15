# Enviar correo Rechazo 

![enviarcorreorechazo](../../screenshots/Flujos/enviar%20correo%20rechazo.png)

[[_TOC_]]

# Power Apps V2 Action

## Descripción

Esta acción se utiliza para definir un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con propiedades específicas.

## Inputs

### schema

El esquema que define las propiedades de la entrada.

#### text (email_Colaborador)

- Tipo: String
- Descripción: Ingrese el correo electrónico del colaborador.
- Dinámicamente añadido: Sí

#### text_1 (Asunto)

- Tipo: String
- Descripción: Ingrese el asunto del correo.
- Dinámicamente añadido: Sí

#### text_2 (contenido)

- Tipo: String
- Descripción: Ingrese el contenido del correo.
- Dinámicamente añadido: Sí

#### text_3 (Objetivo)

- Tipo: String
- Descripción: Ingrese el objetivo que se rechaza.
- Dinámicamente añadido: Sí

#### text_4 (ID del objetivo)

- Tipo: String
- Descripción: Ingrese el ID del objetivo.
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

# Update Row V2 SQL Action

## Descripción

Esta acción se utiliza para actualizar una fila existente en una tabla de base de datos SQL.

## Inputs

### host

Configuración del servidor SQL donde se actualizará la fila.

#### connectionName

- Valor: shared_sql
- Descripción: Nombre de la conexión a utilizar.

#### operationId

- Valor: PatchItem_V2
- Descripción: Identificador de la operación para actualizar un elemento.

#### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_sql
- Descripción: Identificador de la API para PowerApps.

### parameters

#### server

- Valor: default
- Descripción: Servidor SQL donde se actualizará la fila.

#### database

- Valor: default
- Descripción: Base de datos SQL donde se actualizará la fila.

#### table

- Valor: [dbo].[PerfReview_Objectives]
- Descripción: Nombre de la tabla en la que se actualizará la fila.

#### id

- Valor: @triggerBody()['text_4']
- Descripción: ID del objetivo que se actualizará.

#### item/Cerrado_colaborador

- Valor: false
- Descripción: Estado cerrado del colaborador a actualizar.

### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

# Send an Email V2 Action

## Descripción

Esta acción se utiliza para enviar un correo electrónico.

## Inputs

### host

Configuración del servidor de correo donde se enviará el correo electrónico.

#### connectionName

- Valor: shared_office365_1
- Descripción: Nombre de la conexión a utilizar.

#### operationId

- Valor: SendEmailV2
- Descripción: Identificador de la operación para enviar un correo electrónico.

#### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_office365
- Descripción: Identificador de la API para Office 365.

### parameters

#### emailMessage/To

- Valor: @triggerBody()['text']
- Descripción: Dirección de correo electrónico del destinatario.

#### emailMessage/Subject

- Valor: @triggerBody()['text_1']
- Descripción: Asunto del correo electrónico.

#### emailMessage/Body

- Valor: Contenido HTML del correo, incluyendo el objetivo rechazado y un mensaje adicional.
- Descripción: Cuerpo del correo electrónico.

#### emailMessage/Importance

- Valor: Normal
- Descripción: Nivel de importancia del correo electrónico.

### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión de correo electrónico.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
