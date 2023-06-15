# Agregar datos Claborador new

![datoscolab](../../screenshots/Flujos/Almacenar%20datos%20colaborador/Almacenar%20dat%20colab.png)


[[_TOC_]]

# Power Apps V2 Action

## Descripción

Esta acción se utiliza para definir un conjunto de entradas para una aplicación de Power Apps. La acción acepta un objeto con propiedades específicas.

## Inputs

### schema

El esquema que define las propiedades de la entrada.

#### text (PR_ID)

- Tipo: String
- Descripción: Introduce la ID de revisión de desempeño (PR) de un usuario.
- Dinámicamente añadido: Sí

#### text_1 (PR_OBJ_ID)

- Tipo: String
- Descripción: Introduce la ID de objetivo de la revisión de desempeño (PR).
- Dinámicamente añadido: Sí

#### text_2 (objective)

- Tipo: String
- Descripción: Introduce el objetivo.
- Dinámicamente añadido: Sí

#### text_3 (creado_por)

- Tipo: String
- Descripción: Introduce el nombre de la persona que creó el objetivo.
- Dinámicamente añadido: Sí

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.

# Insert Row V2 SQL Action

## Descripción

Esta acción se utiliza para insertar una nueva fila en una tabla de base de datos SQL. Utiliza los valores de las propiedades proporcionadas en la entrada para insertar la fila.

## Inputs

### host

Configuración del servidor SQL donde se insertará la fila.

#### connectionName

- Valor: shared_sql
- Descripción: Nombre de la conexión a utilizar.

#### operationId

- Valor: PostItem_V2
- Descripción: Identificador de la operación para insertar un elemento.

#### apiId

- Valor: /providers/Microsoft.PowerApps/apis/shared_sql
- Descripción: Identificador de la API para PowerApps.

### parameters

#### server

- Valor: default
- Descripción: Servidor SQL donde se insertará la fila.

#### database

- Valor: default
- Descripción: Base de datos SQL donde se insertará la fila.

#### table

- Valor: [dbo].[PerfReview_Objectives]
- Descripción: Nombre de la tabla en la que se insertará la fila.

#### item/PR_OBJ_ID

- Valor: @triggerBody()['text_1']
- Descripción: ID del objetivo de la revisión de desempeño que se insertará.

#### item/PR_ID

- Valor: @triggerBody()['text']
- Descripción: ID de la revisión de desempeño que se insertará.

#### item/IndicadorNegocio

- Valor: @triggerBody()['text_2']
- Descripción: Indicador de negocio que se insertará.

#### item/Firmado

- Valor: false
- Descripción: Estado de la firma de la revisión de desempeño.

#### item/creadoPor

- Valor: @triggerBody()['text_3']
- Descripción: Nombre de la persona que creó el objetivo.

### authentication

- Valor: @parameters('$authentication')
- Descripción: Parámetros de autenticación para la conexión SQL.

### metadata

- operationMetadataId: Un identificador único para los metadatos de operación.
