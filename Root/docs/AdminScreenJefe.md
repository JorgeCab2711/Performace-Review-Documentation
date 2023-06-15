# Admin screen Jefe

[[_TOC_]]

![Admin-screen-ss](/Root/screenshots/Admin-screen/Admin-ss.png)

## Descripción 

En esta pantalla se hizo una interfaz diseñada exclusivamente para supervisores o jefes de equipos de colaboradores. Solo aquellos encargados de  colaboradores tienen acceso a esta pantalla, que se encuentra en la sección "HomeScreenNew". Permite filtrar las revisiones de rendimiento por fecha, visualizar resultados, agregar objetivos y acceder a información relevante a través de galerías interactivas. Es una herramienta poderosa para la gestión eficiente y efectiva de colaboradores, mejorando la comunicación y facilitando la toma de decisiones informadas.

**Disclaimer**: Puesto que el usuario que se esta utilizando no es jefe de nadie (el desarrollador), se utilizó el nombre del Jefe "Francisco Moralejo Giono" en el filter del [Gallery-EmpleadosPR](#gallery-empleados_pr) para poder visualizar la información. 

![errorsolving](../screenshots/Admin-screen/Errorsolving.png)

## Componentes

<ul>

### Date Pickers de los PR
![Date-Pickers](/Root/screenshots/Admin-screen/Datepickers.png)

Estos _DP_ se usan para poder seleccionar el periodo en el que se estará evaluando la calificación de los colaboradores. El gallery que se muestra a continuación está condicionado por estos componentes.

</ul>


<br>
<ul>

### Gallery Empleados_PR
<br>
Este Gallery está condicionado de por la siguiente propiedad `Items`.

```cpp
Filter(
    PerformanceReview,
    // Cambiar esto a  
    Jefe = Text(User().FullName)
    And
    DP_Inicio.SelectedDate  <= DateValue(Text(DateValue(Preiodo_Ev_Inicio),"dd/mm/yyyy"))
    And
    DP_Final.SelectedDate >= DateValue(Text(DateValue(Periodo_Ev_Fin),"dd/mm/yyyy"))
)
```


Como se puede observar en el código, se hace un `Filter` de la tabla `PerformanceReview`, en la cual solo se regresan aquellas filas las cuales cumplan con las siguientes condiciones `AND` :

- Campo Jefe es igual al nombre de usuario de la persona que está utilizando la Aplicación.
- La fecha de inicio del periodo esta dentro o es igual a la fecha seleccionada en el `DatePicker` correspondiente.
- La fecha de fin del periodo esta dentro o es igual a la fecha seleccionada en el `DatePicker` correspondiente.

<br>

### Boton de valores

<br>

Este boton hace visibles los elementos correspondientes con un cambio de variables de `False` a `True` en su propiedad `OnSelect`, también le quita visibilidad a otros componentes pues estos corresponden a otros botones. 

```cpp
Set(View_Values, true);
Set(View_Objectives, false);
Set(bossIsCreatingObjective,false);
Set(selected_user, Text(Email_check.Text));
```

Como podemos observar la variable `selected_user` está también se setea durante este proceso, esto para proveerle información a otros componentes acerca del colaborador que se quiere calificar.

<br>

### Botón de Objetivos
<br>

Este boton hace visibles los elementos correspondientes con un cambio de variables de `False` a `True` en su propiedad `OnSelect`, también le quita visibilidad a otros componentes pues estos corresponden a otros botones. 

```cpp
Set(View_Values, false);
Set(bossIsCreatingObjective,false);
Set(View_Objectives, true);
Set(selected_user, Text(Email_check.Text));
```

Como podemos observar la variable `selected_user` está también se setea durante este proceso, esto para proveerle información a otros componentes acerca del colaborador que se quiere calificar.


### Botón de Resultados

Este botón tiene en su propiedad `OnSelect` setear las variables `selected_user` , `selected_user_ID_Results` , y `bossIsCreatingObjective` como se ve a continuación:

```
Set(selected_user, Text(Email_check.Text));
Set(selected_user_ID_Results, ThisItem.PR_ID);
Set(bossIsCreatingObjective,false);
Refresh(PerfReview_Objectives);
Refresh(PerfReview_Valores);
Refresh(PerformanceReview);
Navigate('Resultados new')
```

Posteriormente, podemos observar que el botón Refresca la información que obtiene de las tablas y se navega a la pantalla [Resultados New](./Resultados%20new.md).




</ul>