# Pantalla: Home Screen


[[_TOC_]]


___
## Descripción
<br>
En esta pantalla se muestra una vista general de la aplicación, proporciona varios botones los cuales condicionalmente navegan a otras pantallas. Desde esta pantalla se selecciona la fecha de inicio y final del Performance Review para el manejo de correcto de los periodos. A continuación hay una imagen para visualizar la pantalla. 


<br>

![Homescreen](/Root/screenshots/HomeScreen/Home.png)

<br>

___

## Componentes y elementos visuales

<ul>

<br>

### Barra de título

<br>


<ul>


![Title-HS](/Root/screenshots/HomeScreen/title-hs.png)

</ul>

* Esta barra está hecha con un componente Botón, el cual se encuentra deshabilitado. El texto de esta corresponde a la pantalla, así como se verá en futuros títulos. Sus bordes tienen valores de radio , esquina derecha superior y esquina izquierda inferior tienen un valor de 10 y las otras dos esquinas tienen un valor de 30.

<ul>

 ![Logo](/Root/screenshots/HomeScreen/Logo.png)

</ul>

* Del lado izquierdo tiene el logo de la empresa, este ya está almacenado en las imagenes de la aplicación. Este está encima de un botón al igual que el titulo pero con un tamaño reducido y con un color de fondo blanco.

<ul>

* ![pp](/Root/screenshots/HomeScreen/profilepic.png)

* ![fn](/Root/screenshots/HomeScreen/fullname.png)

* ![job](/Root/screenshots/HomeScreen/userjob.png)
</ul>

* Del lado derecho de la barra del titulo se encuentrael nombre completo, el puesto y su imagen de perfil. Estos datos se obtienen de una variable llamada ***`User()`*** la cual está por defecto en power apps, en el caso de la foto de perfil y nombre completo.

<br>

### Botón de Iniciar

<ul>

*  ![init](/Root/screenshots/HomeScreen/init%20button.png)
* Este boton solo está habilitado cuando un *PR* no ha sido iniciada en el periodo actual. Si la persona ya pulsó este botón anteriormente, y la fecha actual todavía no es mayor a la fecha límite, el botón estará deshabilitado. A continuación se muestra un snippet la lógica de esta funcionalidad en la propiedad `Display Mode`.

* Para la propiedad *OnSelect*, como se puede ver en la imagen, al estar habilitado este botón, se setean las variables *`IsNew`* y *`PrUUID`* las cuales se utilizan para determinar que el *PR* es nuevo y darle un *ID* único respectivamente.

<br>

### Button_Iniciar / Display mode:


```powerfx
If(
    User().Email in PerformanceReview.Colaboraor,
    DisplayMode.Disabled,
    DisplayMode.Edit
)
```

Como se puede observar la propiedad de *`Display Mode`* cambia dependiendo si el colaborador ya está registrado en la base de datos *`PerformanceReview`* lo cual sucede en la siguiente pantalla al calificar los valores. Ver pantalla: [Valores Corporativos Colaborador new](/Root/docs/Valores%20Corporativos%20Colaborador.md).
</ul>

<br>

### Botón Editar Objetivos
<ul>
- Este botón solamente está habilitado cuando ya se inició un PR. A continuación un snippet con su propiedad `Display Mode`:

```
If(
    Text(User().Email) in PerformanceReview.Colaboraor,
    DisplayMode.Edit,
    DisplayMode.Disabled
)
```
<br>

Si el usuario está registrado en la base de datos `PerformanceReview` el botón estará habilitado, de lo contrario no lo estará. 

- ![edit-obj-btn](/Root/screenshots/HomeScreen/boton-edit-objetivos.png)
- Al estar habilitado este botón se dirije a la pantalla ***"`Indicadores de Negocio Colaborador_new`"*** y se setea la variable *`Email`* que nos sirve en la pantallaque a la que se está redirigiendo. Todo esto en la propiedad *`OnSelect`*.
- A diferencia de los próximos botones , la redirección de este botón no está condicionada, es decir, el botón no depende de una variable externa como la fecha actual para redirigirse a otra pantalla.

</ul>

<br>

### Botón Editar Valores
<ul>

- Este botón solamente está habilitado cuando ya se inició un PR. A continuación un snippet con su propiedad `Display Mode`:

    ```
    If(
        Text(User().Email) in PerformanceReview.Colaboraor,
        DisplayMode.Edit,
        DisplayMode.Disabled
    )
    ```

    Si el usuario está registrado en la base de datos `PerformanceReview` el botón estará habilitado, de lo contrario no lo estará. 

- Este es el código de la propiedad OnSelect del botón:
    
    ```{powerfx}
        Set(Email,"");
        Switch(
            // Si esta en el periodo actual irá a la pantalla           "Edit_valores_new"
            Today() <= DateValue(Periodo_Fin_FromSQL.Text)
            And 
            Today() >= DateValue(Periodo_Inicio_FromSQL.Text),
            Navigate(Edit_valores_inicio_new),
            //si esta por encima de la fecha final del periodo irá a "Edit valores fin new"
            Today() > DateValue(period_end.SelectedDate),
            Navigate('Edit valores fin new')
        );
        Set(fromSQLPR_ID,
            First(
                Filter(
                    PerformanceReview,
                    Colaboraor = Text(User().Email),
                    Today() <= DateValue(period_end)
                    And 
                    Today() >= DateValue(period_start)
                )
            ).PR_ID
        );
    ```

    
    Este código de Power FX tiene las siguientes funcionalidades:

    - Establece la variable `Email` como una cadena vacía.
    - Utiliza una declaración `Switch` para tomar decisiones basadas en condiciones.
    - Si la fecha actual está dentro del período especificado por las fechas `Periodo_Fin_FromSQL.Text` y `Periodo_Inicio_FromSQL.Text`, navegará a la pantalla "Edit_valores_inicio_new".
    - Si la fecha actual es posterior a la fecha final del período especificado por `period_end.SelectedDate`, navegará a la pantalla "Edit valores fin new".
    - Establece la variable `fromSQLPR_ID` como el ID del primer registro de la tabla `PerformanceReview` que cumpla con las siguientes condiciones:
    - El campo `Colaboraor` es igual al correo electrónico del usuario actual (`User().Email`).
    - La fecha actual está dentro del período definido por las fechas `period_end` y `period_start`.

    - Los componentes `Periodo_Fin_FromSQL` , `Periodo_Inicio_FromSQL` , ` period_end` y `period_start`, se pueden encotrar en las zonas vacías de la pantalla , estas tienen la propiedad *Visible* deshabilitada. A continuación dos screenshots para mostrar su localización:

        ![location](/Root/screenshots/HomeScreen/hidden-vars.png)
        ![location2](/Root/screenshots/HomeScreen/hidden-vars2.png)
    
    - _Setea_ la variable `fromSqlPR_ID` para tener su uso posterior en la pantalla a la que se está navegando una vez pulsado el botón. Aquí se obtiene del SQL el PR_ID del usuario en el periodo actual.

</ul>

<br>

### Botón Auto Evaluarme

<ul>

- Este botón solamente está habilitado cuando ya se inició un PR y el fin del periodo seleccionado ya pasó la fecha actual. A continuación un snippet con su propiedad `Display Mode`:

    ```
    If(
        Today() > period_end.SelectedDate,
        DisplayMode.Edit,
        DisplayMode.Disabled
    )
    ```

    Si el usuario está registrado en la base de datos `PerformanceReview` el botón estará habilitado, de lo contrario no lo estará. 

- A diferencia de los otros botones este simplemente se redirije a la pantalla `Valores Corporativos Colaborador 2_new`.



</ul>

### Date Pickers Inicio y fin del periodo


<ul>

![datepickers](/Root/screenshots/HomeScreen/DatePickers.png)  

Los elementos seleccionados en el screenshot estarán habilitados únicamente si el PR no se ha iniciado, una vez este empiece, estos elementos cambiarán el valor de su propiedad `Visible`.

A continuación se muestra el código de la propiedad `Visible` para los elementos seleccionados :

```
! (Button_Iniciar.DisplayMode=DisplayMode.Disabled)
```

Como se puede observar, la disponibilidad de este botón depende directamente del estado de la propiedad `Display Mode` del *botón iniciar* .  
Ver: [Boton iniciar](#botón-de-iniciar)



</ul>

<br>

### Mensaje y texto de bienvenida
<ul>

![welcome-message](/Root/screenshots/HomeScreen/welcome-text.png)

- Estos componentes se dividen en dos partes:
    
    * Label/Boton de bienvenida: 
        <ul>

        <li> 
        
        En este mensaje de bienvenida simplemente hay un texto concatenando el nombre completo del colaborador usando la variable `User()`.
        
        <br>

        ```
        Concatenate("Bienvenid@ ", Text(User().FullName))
        ```

        Esto en su propiedad `Text`.

        </ul>
    


    * Background de Bienvenida:
        <ul>
        <li> 
        
        ![backgroud-welcome](/Root/screenshots/HomeScreen/backgroud-welcome.png)
        
        Como se puede ver, la propiedad texto de este componente también es una concatenación. A continuación se provee el código fuente:
        ```powerapps
        Concatenate(
            "Usted está por iniciar su evaluación de Valores Corporativos dentro del proceso de evaluación de desempeño. Su jefe será notificado y podrá ver sus respuestas.Verifique que su jefe es ",
        Office365Users.ManagerV2(User().Email).displayName,"."
        )
        ```
        
        </ul>

</ul>



### Componentes invisibles
<ul>

Algunos de los componentes en esta pantalla tienen su propiedad de visibilidad seteada a _False_.

![invisible-components](/Root/screenshots/HomeScreen/Invi-hs.png)

En este caso los componentes que se muestran seleccionados en la imagen se no aparecen para todos los colaboradores , solamente a aquellos usuarios que la condicional en su propiedad ***Visible*** sea ***true***:

```powerfx
CountRows(myReports) > 0
```

También podemos encontrar algunos componentes invisibles que son indispensables para el funcionamiento de la pantalla, estos componentes siempre tienen su propiedad _Visible_ seteada a *False*. En la siguiente imagen se muestra la localización de estos componentes.

![invcomp2-hs](/Root/screenshots/HomeScreen/other-inv-hs.png)


Estas variables son :

- `PR_ID_NEW` :
    * Esta variable nos sirve para darle un nuevo PR_ID al usuario , genere un GUID cada vez que carga la aplicación.
    Codigo del componente en la propiedad _Text_ a continuación:
        ```
        GUID()
        ```

<br>

- `Periodo_Inicio_FromSQL`: 
    * Esta variable obtiene el periodo inicial por medio del Correo del colaborador. El proximo snippet representa el valor de la propiedad _Text_ :
        ```
        LookUp(
            PerformanceReview,
            Colaboraor = User().Email,
            Preiodo_Ev_Inicio
        )
        ```
- `Periodo_Fin_FromSQL`:
    * Esta variable obtiene el periodo final por medio del Correo del colaborador. El proximo snippet representa el valor de la propiedad _Text_ :
        ```
        LookUp(
            PerformanceReview,
            Colaboraor = User().Email,
            Periodo_Ev_Fin
        )
        ```
- `TL_NombreUsuario_8`:
    * Esta variable simplemete contiene el nombre completo del usuario, a continuación se puede ver el valor de su propiedad _Text_
        ```
        User().FullName
        ```


</ul>


</ul>

