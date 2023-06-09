
AlmacenarDatosColaborador.Run(Text(PR_ID_NEW), Text(CorreoCol), Text(period_start),Text(period_end),Text(Office365Users.ManagerV2(User().Email).displayName));
ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(ID_TEE),
    "Honestidad",
    If(
        Select_Honestidad.Selected.Value = "No Cumple",
        "0.44",
        If(
            Select_Honestidad.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                Select_Honestidad.Selected.Value = "Cumple",
                "1.33",
                If(
                    Select_Honestidad.Selected.Value = "Supera",
                    "1.78",
                    If(
                        Select_Honestidad.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(Comment_Honestidad)
    
);

ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(ID_TEE.Text),
    "TrabajoEnEquipo",
    If(
        Select_TEE.Selected.Value = "No Cumple",
        "0.44",
        If(
            Select_TEE.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                Select_TEE.Selected.Value = "Cumple",
                "1.33",
                If(
                    Select_TEE.Selected.Value = "Supera",
                    "1.78",
                    If(
                        Select_TEE.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(Comment_TE.Text)
);

ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(ID_Divertirse.Text),
    "Divertirse",
    If(
        Select_Div.Selected.Value = "No Cumple",
        "0.44",
        If(
            Select_Div.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                Select_Div.Selected.Value = "Cumple",
                "1.33",
                If(
                    Select_Div.Selected.Value = "Supera",
                    "1.78",
                    If(
                        Select_Div.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(Comment_Div.Text)
);

ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(ID_FEEC.Text),
    "FocoEnElCliente",
    If(
        Select_FEE.Selected.Value = "No Cumple",
        "0.44",
        If(
            Select_FEE.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                Select_FEE.Selected.Value = "Cumple",
                "1.33",
                If(
                    Select_FEE.Selected.Value = "Supera",
                    "1.78",
                    If(
                        Select_FEE.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(Comment_FEC.Text)
);

ValoresColaboradornew.Run(
    Text(PR_ID_NEW.Text),
    Text(ID_Innova.Text),
    "Innovacion",
    If(
        Select_Inn.Selected.Value = "No Cumple",
        "0.44",
        If(
            Select_Inn.Selected.Value = "Cumple Parcialmente",
            "0.98",
            If(
                Select_Inn.Selected.Value = "Cumple",
                "1.33",
                If(
                    Select_Inn.Selected.Value = "Supera",
                    "1.78",
                    If(
                        Select_Inn.Selected.Value = "Excede",
                        "2.22"
                    )
                )
            )
        )
    ),
    Text(Comment_Innova.Text)
);




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
