# Valores Corporativos Colaborador_new
![main](/screenshots/Valores%20Colaborador/Valores-corp-col-pant.png)

<br>

## **Índice**




____

<br>




### **Barra de título**

<ul>

![image](/screenshots/Valores%20Colaborador/Title-valores-colab.png)

Se tiene exactamente la misma lógica que en la pantalla de inicio, hay dos diferencias fundamentales. La primera diferencia es claramente el texto que describe el nombre de la pantalla y la segunda es el botón de ***Home*** este botón simplemente tiene un navigate a la pantalla [PR-HomeScreen_new](/docs/PR-HomeScreen_new.MD), y refresca las based de datos `PerformanceReview`, `PerfReview_Valores` y `PerfReview_Objectives` a continuación la función de este botón en su propiedad `OnSelect`:

    ```
    Navigate('PR-HomeScreen_new');
    Refresh(PerformanceReview);
    Refresh(PerfReview_Valores);
    Refresh(PerfReview_Objectives);
    ```

</ul>

<br>

### **Botones / labels de valores**

<ul>

![valores-desc](/screenshots/Valores%20Colaborador/Valores-desc.png)

Cada uno de estos componentes son simplemente botones desactivados como se describió en el archivo [README](/README.MD). Cada valor tiene un botón que actúa como el título y otro que es la descripción de cada valor.

</ul>

<br>


### **Dropdowns y Text Boxes**
<ul>

![dropdowns](/screenshots/Valores%20Colaborador/dropdowns.png)

Todos los Dropdowns tienen exactamente la misma lógica, una lista de elementos que representan una calificación a cada valor, los valores son los siguientes en su propiedad Items:

    [ "","No Cumple","Cumple Parcialmente", "Cumple", "Supera", "Excede"]

Cada uno de estos _dropdowns_ y _text inputs_ corresponden a un valor adyacente. Aquí un una tabla de los correspondientes valores.

|  Valor       | Nombre Drop Down | Nombre input text box |
|:------------:|-------------:|-------------:|
| Honestidad    |  Select_Honestidad   | Comment_Honestidad |
|  Trabajo en Equipo   | Select_TEE   |Comment_TE |
| Divertirse    | Select_Div  | Comment_Div |
| Foco en el Cliente    | Select_FEE    |Comment_FEC |
| Innovación    | Select_Inn    |Comment_Innova |


</ul>


### **Botón entregar**

<ul>

<br>

**Propiedad: Display Mode**
<ul>
El Display mode de este botón no se activa hasta que el usuario haya llenado los campos necesarios, aquí el código para la propiedad Display Mode:

    If(! (      
            Select_Honestidad.Selected.Value = "" 
            Or Select_TEE.Selected.Value = "" 
            Or Select_Div.Selected.Value = ""
            Or Select_FEE.Selected.Value = ""
            Or Select_Inn.Selected.Value = ""
        ),
        DisplayMode.Edit,
        DisplayMode.Disabled 
    )

Como se puede observar el botón no se habilitará hasta que todos los Drop Downs tengan un valor diferente de `""`.


</ul>

<br>

**Propiedad: OnSelect**

Este botón es fundamental para el funcionamiento correcto de la aplicación , pues se encarga de registrar al usuario , a la vez que ingresar los datos de la auto evaluación de los valores del usuario. Utilizando los flujos `AlmacenarDatosColaborador` y `ValoresColaboradornew`. 

Ver:

- [Flujo-Almacenar-Datos-Colaborador](/docs/FLujos/AlmacenarDatosColaborador.md).

- [Flujo-Valores-Colaborador-new](/docs/FLujos/ValoresColaboradornew.md).


El siguiente código conforma la lógica del botón el la respectiva propiedad:

```
AlmacenarDatosColaborador.Run(
    Text(PR_ID_NEW),
    Text(CorreoCol), 
    Text(period_start),
    Text(period_end),
    Text(Office365Users.ManagerV2(User().Email).displayName)
    );

```
Como podemos ver, se le pasan los parámetros al flujo `AlmacenarDatosColaborador`, 


</ul>