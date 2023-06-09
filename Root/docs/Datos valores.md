# Datos Valores 

[[_TOC_]]

![view-valores](/Root/screenshots/Datos%20Valores/Overall-datos-valores.png)

## Descripción

Esta es una pantalla a la que el usuario no puede acceder por ningun medio, se usa como un tipo de store para evitar agregar más componentes invisiblese a cada una de las pantallas. Aquí se guardan varias de las variables que se utilizan para darle GUID´s a los valores que se ven en la pantalla [Valores-Colaborador-new](/Root/docs/Valores%20Corporativos%20Colaborador.md). El galery qe se tiene en esta pantalla no cumple otro propósito más que el de testear ciertos filtros en las tablas de la base de datos `planillas`.


## Componentes

<ul>
<br>

### ID_Honestidad
- Este componente solamente tiene una fórmula en su propiedad _Text_, la cual genera un GUID para pasar a otras pantallas a su respectivo valor.

<br>

### ID_TEE
- Este componente solamente tiene una fórmula en su propiedad _Text_, la cual genera un GUID para pasar a otras pantallas a su respectivo valor.
<br>

### ID_Innova
- Este componente solamente tiene una fórmula en su propiedad _Text_, la cual genera un GUID para pasar a otras pantallas a su respectivo valor.
<br>

### ID_FEEC
- Este componente solamente tiene una fórmula en su propiedad _Text_, la cual genera un GUID para pasar a otras pantallas a su respectivo valor.

<br>

### ID_Divertirse
- Este componente solamente tiene una fórmula en su propiedad _Text_, la cual genera un GUID para pasar a otras pantallas a su respectivo valor.

<br>

### DP_PER_INICIO
- Date picker para el test del _Filter_ en el inicio del periodo.

<br>

### DP_PER_FIN
- Date picker para el test del _Filter_ en el final del periodo.
<br>

### Gallery3
- Como se mencionó anteriormente, esta galería tiene el propósito de testear los filtros en algunas tablas de la base de datos. Se filtra el periodo por medio de los date pickers anteriores.

    ```
    Search(PerformanceReview,User().Email, "Colaboraor")
    ```
<br>
</ul>