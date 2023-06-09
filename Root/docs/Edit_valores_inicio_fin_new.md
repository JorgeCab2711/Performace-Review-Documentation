# Edit valores fin new

[[_TOC_]]

![Edit-screen-fin](/Root/screenshots/Editar%20Valores/edit-screen-overall.png)


## Descripción
Esta pantalla se utiliza para modificar las calificaciones de los valores que se tienen en la tabla `PerfReview_Valores` con el respectivo PR_ID del usuario. Este PR_ID se obtiene de la ***variable invisible*** `fromSQLPR_ID`, la cual se encuentra en la pantalla [PR-HomeScreen_new](/Root/docs/PR-HomeScreen_new.MD#botón-editar-objetivos), en el botón editar objetivos.

___
<br>

## Componentes
<ul>
<br>

### Mensaje motivacional
![motivational-message](/Root/screenshots/Edit%20Valores%20Fin/motivational-message.png)

Se agrega un botón-label con el título "Self-improvement", el cual no tiene otro propósto más que tener llenar el espacio vacío en la pantalla.

Bajo este componente, solo hay una imagen demostrando el visualmente el texto del componente anterior.

<br>

### Dropdown Select_edit_valor_1
<br>
En este DD, se tiene la una lista de los valores disponibles a modificar.

    ["","Honestidad","Divertirse","Trabajo en Equipo", "Innovación","Foco en el cliente"]

El valor seleccionado será pasado al flujo en el botón entregar más adelante.

![Drop-down-edit-valor](/Root/screenshots/Edit%20Valores%20Fin/edit-valores-select-val.png)

### Dropdown Select_req_calif_1
<br>
En este DD, se tiene la una lista de la calificación de los valores disponibles a modificar.

    ["","No Cumple","Cumple Parcialmente", "Cumple", "Supera", "Excede"]

El valor seleccionado será pasado al flujo en el botón entregar más adelante.

![Drop-down-edit-valor-calif](/Root/screenshots/Edit%20Valores%20Fin/edit-val-fin-req.png)


### ComentarioEdit_1

Este componente simplemente es un text input el cual puede ser usado para que el usuario cambie su comentario al valor que seleccione.

![comment-edit](/Root/screenshots/Edit%20Valores%20Fin/valores-fin-new-comm.png)

### Botón entregar 

![boton-entregar](/Root/screenshots/Edit%20Valores%20Fin/boton-entregar.png)

<br>
<ul>

#### Propiedad Display mode
Este botón está condicionado para que el usuario tenga que llenar obligatoriamente los Drop down del valor y la calificación.
```
If(
    Select_edit_valor_1.Selected.Value = ""
    Or
    Select_req_calif_1.Selected.Value = ""
    Or
    ComentarioEdit_1.Text = ""
    ,
    DisplayMode.Disabled,
    DisplayMode.Edit
)
```

#### Propiedad OnSelect
Al tener todos los Drop Down llenos el usuario será capaz de modificar el valor pulsando el botón. Si el campo de Comentario está vacío, se sobreescribirá el comentario anterior a la modificación y el comentario quedará en blanco. Para esto el botón ejecutará el flujo `EditValoresnew`, donde se modifica el valor del usuariom, obteniendo el PR_ID del usuario por medio de la variable `fromSQLPR_ID` y los valores que se seleccionen del valor de cada uno de los dropdowns y del text input del comentario. Aquí el código de la propiedad: 
```
EditValoresnew.Run(
    fromSQLPR_ID,
    Switch(
        Select_edit_valor.Selected.Value, 
        "Honestidad","Honestidad",
        "Divertirse", "Divertirse",
        "Trabajo en Equipo", "TrabajoEnEquipo",
        "Innovación", "Innovacion",
        "Foco en el cliente", "FocoEnElCliente"
    ),
    Switch(
        Select_req_calif.Selected.Value,
        "No Cumple","0.44",
        "Cumple Parcialmente","0.98",
        "Cumple","1.33",
        "Supera","1.78",
        "Excede","2.22"
    ),
    ComentarioEdit
);
Notify("Se ha modificado el valor: [" & Select_edit_valor.Selected.Value & ": " & Select_req_calif.Selected.Value & "]");
Set(valores_saved,true);
Reset(Select_req_calif);
Reset(Select_edit_valor);
Reset(ComentarioEdit);
```

Al final del proceso se le da una notificación al usuario acerca del valor que se editó y qué calificación se le dió, también se setea la variable `valore_saved` a **true** y se resetean los componentes `Select_req_calif`,`Select_edit_valor`, `ComentarioEdit`.

Ver: [Flujo-edit-valores-fin](/Root/docs/FLujos/edit-valores-fin-new.md)

</ul>

</ul>

___
<br>

