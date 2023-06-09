# Flujo: Almacenar Datos Colaborador

![overall](/Root/screenshots/Flujos/AlmacenarDatosColaborador/overall-ADC.png)


Este flujo toma los parámetros pasados por el _Action_ Power Apps (v2) los cuales son los siguientes:

<ul>
    <li> PR_ID
    <li> Emai Colaborador
    <li> Fecha Inicio
    <li> Fecha fin
    <li> Jefe
</ul>


Los parametros luego se usarán en el _Action_  **Insert Row** , para agregar los parametros a su respectivo campo en la tabla ***PerformanceReview*** en la base de datos _planillas_.

![general](/Root/screenshots/Flujos/AlmacenarDatosColaborador/General-view.png)

Luego usa el parametro `PR_ID` y `email_colab` para enviarle un correo al usuario, proporcionandole el su `PR_ID` para su proxima auto evaluación en el mismo periodo.

![general2](/Root/screenshots/Flujos/AlmacenarDatosColaborador/General-view-2.png)