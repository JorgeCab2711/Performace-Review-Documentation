# Pantalla: ValoresColaboradorFinnew


[[_TOC_]]

<br>

# Descripción
Esta pantalla es muy similar a la pantalla Valores Corporativos Colaborador new, las mayores diferencias es que esta pantalla son:
<ul>

* Esta pantalla se utiliza para el final del periodo.

* Utiliza el flujo [ValoresColaboradorFinnew](/Root/docs/FLujos/ValoresColaboradornew.md) en vez de [ValoresColaboradornew](/Root/docs/FLujos/ValoresColaboradornew.md).

* No utiliza el flujo [AlmacenarDatosColaborador](/Root/docs/FLujos/AlmacenarDatosColaborador.md.)

* Le pide al usuario su `PR_ID` , el cual fue mandado a su correo en la pantalla [ValoresColaboradornew](/Root/docs/Valores%20Corporativos%20Colaborador.md), al calificar sus valores.

</ul>

<br>

# Componentes

## Barra de título
<br>
<ul>

![image](/Root/screenshots/Valores%20Colaborador/Title-valores-colab.png)

Se tiene exactamente la misma lógica que en la pantalla de inicio, hay dos diferencias fundamentales. La primera diferencia es claramente el texto que describe el nombre de la pantalla y la segunda es el botón de ***Home*** este botón simplemente tiene un navigate a la pantalla [PR-HomeScreen_new](/Root/docs/PR-HomeScreen_new.MD), y refresca las based de datos `PerformanceReview`, `PerfReview_Valores` y `PerfReview_Objectives` a continuación la función de este botón en su propiedad `OnSelect`:

    ```
    Navigate('PR-HomeScreen_new');
    Refresh(PerformanceReview);
    Refresh(PerfReview_Valores);
    Refresh(PerfReview_Objectives);
    ```
</ul>

## Botones-labels de valores
<br>
<ul>

![valores-desc](/Root/screenshots/Valores%20Colaborador/Valores-desc.png)

Cada uno de estos componentes son simplemente botones desactivados como se describió en el archivo [README](/README.MD). Cada valor tiene un botón que actúa como el título y otro que es la descripción de cada valor.

</ul>

<br>

## Dropdowns y Text Boxes
<br>
<ul>

![dropdowns](/Root/screenshots/Valores%20Colaborador/dropdowns.png)

Todos los Dropdowns tienen exactamente la misma lógica, una lista de elementos que representan una calificación a cada valor, los valores son los siguientes en su propiedad Items:

    [ "","No Cumple","Cumple Parcialmente", "Cumple", "Supera", "Excede"]

Cada uno de estos _dropdowns_ y _text inputs_ corresponden a un valor adyacente. Aquí un una tabla de los correspondientes valores.

|  Valor       | Nombre Drop Down | Nombre input text box |
|:------------:|-------------:|-------------:|
| Honestidad    |  Select_Honestidad_Fin   | Comment_Honestidad_Fin |
|  Trabajo en Equipo   | Select_TEE_Fin   |Comment_TE_Fin |
| Divertirse    | Select_Div  | Select_Div_Fin |
| Foco en el Cliente    | Select_FEE_Fin    |Comment_FEC_Fin |
| Innovación    | Select_Inn_Fin    |Comment_Innova_Fin |


</ul>


## Botón entregar

<ul>

<br>

**Propiedad: Display Mode**
<ul>
El Display mode de este botón no se activa hasta que el usuario haya llenado los campos necesarios, aquí el código para la propiedad Display Mode:

    If(! (      
            Select_Honestidad_Fin.Selected.Value = "" 
            Or Select_TEE_Fin.Selected.Value = "" 
            Or Select_Div_Fin.Selected.Value = ""
            Or Select_FEE_Fin.Selected.Value = ""
            Or Select_Inn_Fin.Selected.Value = ""
        ),
        DisplayMode.Edit,
        DisplayMode.Disabled 
    )

Como se puede observar el botón no se habilitará hasta que todos los Drop Downs tengan un valor diferente de `""`.


</ul>

<br>

**Propiedad: OnSelect**

Este botón es fundamental para el funcionamiento correcto de la pantalla, a la vez que ingresar los datos de la auto evaluación de los valores del usuario. Utilizando el flujo `ValoresColaboradornew`.

Ver:


- [Flujo-Valores-Colaborador-Fin-new](/Root/docs/FLujos/ValoresColaboradorFinnew.MD).

<br>


En esta parte se ejecuta varias veces el flujo `ValoresColaboradornew` una vez para cada valor , Aquí un ejemplo general del código:



```
ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(<ID_DEL_RESPECTIVO_VALOR>),
    "<NOMBRE_DEL_VALOR_EN_EL_SQL>",
    If(
        <NOMBRE_DEL_DROPDOWN_DEL_VALOR>.Selected.Value = "No Cumple",
        "0.44",
        If(
            <NOMBRE_DEL_DROPDOWN_DEL_VALOR>.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                <NOMBRE_DEL_DROPDOWN_DEL_VALOR>.Selected.Value = "Cumple",
                "1.33",
                If(
                    <NOMBRE_DEL_DROPDOWN_DEL_VALOR>.Selected.Value = "Supera",
                    "1.78",
                    If(
                        <NOMBRE_DEL_DROPDOWN_DEL_VALOR>.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(<NOMBRE_DEL_COMPONENTE_DEL_COMENTARIO>)
    
);
```

Notar que al valor se le da una ponderación dependiendo de la auto evaluación seleccionada en el Dropdown de calificación. Ver la siguiente tabla:

|  Calificación       | Ponderación |
|:------------:|-------------:|
| No Cumple  |   0.44  |
|  Cumple Parcialmente  | 0.98   |
| Cumple    | 1.33  |
|  Supera   |   1.78  |
| Excede  |   2.22  |

<br>

Posteriormente se resetean varios de los componentes de la pantalla, cuando ya estan llenados, para que no haya ninguna redundacia. Se navega a la pantalla _Indicadores de Negocio Colaborador_new_ y se le notifica al usuario que sus valores fueron entregados con éxito.

**Nota :** Aunque sería ideal, la funcionalidad de poder comprobar que el flujo se ejecutó correctamente antes de enviar el mensaje de éxito al usuario no está incorporada.

```
Navigate('Indicadores de Negocio Colaborador_new');
Reset(Select_Honestidad);
Reset(Select_TEE);
Reset(Select_Div);
Reset(Select_FEE);
Reset(Select_Inn);
Reset(Comment_Honestidad);
Reset(Comment_TE);
Reset(Comment_Div);
Reset(Comment_FEC);
Reset(Comment_Innova);
Notify("Valores entregados!",NotificationType.Success,2500);
```

<br>

**Nota :** Para ver el código completo ver de la propiedad onSelect: [OnSelect-Code](/Root/assets/OnselectEntregarVCCFin.fx).