# Indicadores de negocio new

[[_TOC_]]

![indicadoresdenegociooverview](../screenshots/Indicadores%20de%20negocio/Indicadores%20de%20negocio%20overview.png)

## Descripción 

En esta pantalla el usuario puede visualizar, agregar, editar y eliminar sus objetivos. Los objetivos solo pueden ser editados y eliminados si el usuario todavía no los ha cerrado, solo el jefe puede eliminar estos objetivos previamente cerrados. Los campos de la tabla de objetivos se encuentran de la parte izquierda de la pantalla, se muestra la fila del objetivo obteniendo la información de la tabla `PerfReviewObjetivos`, solo para los campos `firmado`, `cerrado`, `creadoPor` e `Indicador de Negocio`. 

<br>

## Componentes principales

<ul>

- <u>OBJ_Colab_gal</u>: Esta galería tiene como propósito visualizar ciertos campos de la tabla `PerfReviewObjetivos`, aquí se puede editar, eliminar, y agregar objetivos. 
    * <u>Agregar Objetivos</u>: Pulsando el botón `+` en la barra superior del gallery se ejecutará el siguiente código en su variable `OnSelect`:
        ```
        Set(isAddingObjective,true);
        Set(isEditingObjective,false);
        ```
        Como se puede ver, el botón setea la variable `isAddingObjective` a `true` para que se pueda visualizar los componetes correspondientes del lado derecho de la pantalla.

        ![verAddingObj](../screenshots/Indicadores%20de%20negocio/Adding-objective.png)

        Cuando el usuario escribe su objetivo en el _text input_ se puede y pulsa el botón agregar se ejecuta el flujo [AgregarObjetivoColaborador](../docs/FLujos/AgregarObjetivoColaborador.md), donde se guarda el objetivo en la base de datos. Para mas detalles del flujo ver la documentación del mismo.
    
    * <u>Editar y cerrar objetivos</u>: 
        Para poder editar los objetivos estos no deben de estar cerrados , cuando el usuario pulsa el boton de `Check` en la gallery.
        
        ![botoncheck](../screenshots/Indicadores%20de%20negocio/btncheck.png)

        Aquí la propiedad `OnSelect` de este botón:
        ```cpp
        Cerrarobjetivo.Run(ThisItem.PR_OBJ_ID);
        UpdateContext({startTimer:true});
        Refresh(PerfReview_Objectives);
        Notify("Objetivo cerrado",NotificationType.Success,2000);
        Refresh(PerfReview_Objectives);
        ```

        Como se puede ver se utiliza el flujo Cerrarobjetivo y se pasa el parametro `ThisItem.PR_OBJ_ID` para poder identificar el objetivo que se está cerrando. También se refresca la información de la tabla `PerfReview_Objectives` y se hace un timeout para darle tiempo a la base de datos de procesar los cambios.

        Si el objetivo no está cerrado este puede se eliminado o editado.

        Al pulsar el botón   ![edit](../screenshots/Indicadores%20de%20negocio/edit.png) el usuario activará la propiedad `Visible` los elementos correspondientes y se podrá visualizar el siguiente apartado:

        ![edit-shows](../screenshots/Indicadores%20de%20negocio/Editshow.png)
        Donde se podrá modificar el objetivo.

        El para confirmar el usuario debe de pulsar el botón de `check` para que se ejecute el flujo de [editarobjetivocolaborador](../docs/FLujos/EditarObjetivocolaborador.md).

    * <u>Eliminar objetivos</u>: 
    Para eliminar los objetivos el usuario simplemente debe de pulsar el botón ![eliminarobjetivos](../screenshots/Indicadores%20de%20negocio/eliminarvalores.png) donde se ejecuta el flujo [DeleteObjectiveColaborador](./FLujos/DeleteObjectiveColaborador.md). 




</ul>