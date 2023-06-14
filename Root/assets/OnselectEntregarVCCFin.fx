
If(
    ! invalid_PR_ID,
    ValoresColaboradorFinnew.Run(
        providedPRID,
        "Honestidad",
        If(
            Select_Honestidad_Fin.Selected.Value = "No Cumple",
            "0.44",
            If(
                Select_Honestidad_Fin.Selected.Value = "Cumple Parcialmente",
                "0.98",
                If(
                    Select_Honestidad_Fin.Selected.Value = "Cumple",
                    "1.33",
                    If(
                        Select_Honestidad_Fin.Selected.Value = "Supera",
                        "1.78",
                        If(
                            Select_Honestidad_Fin.Selected.Value = "Excede",
                            "2.22"
                        )
                    )
                )
            )
        ),
        Comment_Honestidad_Fin  
    );

    ValoresColaboradorFinnew.Run(
        providedPRID,
        "TrabajoEnEquipo",
        If(
            Select_TEE_Fin.Selected.Value = "No Cumple",
            "0.44",
            If(
                Select_TEE_Fin.Selected.Value = "Cumple Parcialmente",
                "0.98",
                If(
                    Select_TEE_Fin.Selected.Value = "Cumple",
                    "1.33",
                    If(
                        Select_TEE_Fin.Selected.Value = "Supera",
                        "1.78",
                        If(
                            Select_TEE_Fin.Selected.Value = "Excede",
                            "2.22"
                        )
                    )
                )
            )
        ),
        Comment_TE_Fin
    );

    ValoresColaboradorFinnew.Run(
        providedPRID,
        "Divertirse",
        If(
            Select_Div_Fin.Selected.Value = "No Cumple",
            "0.44",
            If(
                Select_Div_Fin.Selected.Value = "Cumple Parcialmente",
                "0.98",
                If(
                    Select_Div_Fin.Selected.Value = "Cumple",
                    "1.33",
                    If(
                        Select_Div_Fin.Selected.Value = "Supera",
                        "1.78",
                        If(
                            Select_Div_Fin.Selected.Value = "Excede",
                            "2.22"
                        )
                    )
                )
            )
        ),
        Comment_Div_Fin
    );

    ValoresColaboradorFinnew.Run(
        providedPRID,
        "FocoEnElCliente",
        If(
            Select_FEE_Fin.Selected.Value = "No Cumple",
            "0.44",
            If(
                Select_FEE_Fin.Selected.Value = "Cumple Parcialmente",
                "0.98",
                If(
                    Select_FEE_Fin.Selected.Value = "Cumple",
                    "1.33",
                    If(
                        Select_FEE_Fin.Selected.Value = "Supera",
                        "1.78",
                        If(
                            Select_FEE_Fin.Selected.Value = "Excede",
                            "2.22"
                        )
                    )
                )
            )
        ),
        Comment_FEC_Fin
    );

    ValoresColaboradorFinnew.Run(
        providedPRID,
        "Innovacion",
        If(
            Select_Inn_Fin.Selected.Value = "No Cumple",
            "0.44",
            If(
                Select_Inn_Fin.Selected.Value = "Cumple Parcialmente",
                "0.98",
                If(
                    Select_Inn_Fin.Selected.Value = "Cumple",
                    "1.33",
                    If(
                        Select_Inn_Fin.Selected.Value = "Supera",
                        "1.78",
                        If(
                            Select_Inn_Fin.Selected.Value = "Excede",
                            "2.22"
                        )
                    )
                )
            )
        ),
        Comment_Innova_Fin
    );

    Navigate('Indicadores de Negocio Colaborador_new');
    Reset(Select_Honestidad_Fin);
    Reset(Select_TEE_Fin);
    Reset(Select_Div_Fin);
    Reset(Select_FEE_Fin);
    Reset(Select_Inn_Fin);
    Reset(Comment_Honestidad_Fin);
    Reset(Comment_TE_Fin);
    Reset(Comment_Div_Fin);
    Reset(Comment_FEC_Fin);
    Reset(Comment_Innova_Fin);  
    ,
    Notify("La clave proporcionada no es válida.",NotificationType.Error)

)
