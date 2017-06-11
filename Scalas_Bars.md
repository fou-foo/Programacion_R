Escala continua con *scale\_fill\_brewer* de *ggplot*

    library(ggplot2)
    # airquality # datos prueba
    ggplot(data = airquality, aes(x = factor(Month), y = Ozone, fill = factor(Month))) + #indicas la variable de agrupamiento -debe ser tipo factor- y la de interes, tambien requieres llenar el parametro 'fill' con la variable con la que agrupa 
        geom_bar(stat="identity") +   # se construyen las barras
        scale_fill_brewer(palette = 'RdPu')+ # la magia de poder escoger facíl el color de la escala 'continua' o discreta
        xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')+  #demas cosas
        guides(fill=FALSE) #quitar leyenda

    ## Warning: Removed 37 rows containing missing values (position_stack).

![](Scalas_Bars_files/figure-markdown_strict/unnamed-chunk-1-1.png)

Escala discreta con *scale\_fill\_brewer* de *ggplot*

    ggplot(data = airquality, aes(x = factor(Month), y = Ozone, fill = factor(Month))) + #indicas la variable de agrupamiento -debe ser tipo factor- y la de interes, tambien requieres llenar el parametro 'fill' con la variable con la que agrupa 
        geom_bar(stat="identity") +   # se construyen las barras
        scale_fill_brewer(palette = 'Set2')+ # la magia de poder escoger facíl el color de la escala 'continua' o discreta
        xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')+    guides(fill=FALSE) #quitar leyenda

    ## Warning: Removed 37 rows containing missing values (position_stack).

![](Scalas_Bars_files/figure-markdown_strict/unnamed-chunk-2-1.png)

Escala discreta con *brewer.pal* de *RcolorBrewer*

    library(RColorBrewer)
    cols <- brewer.pal(length(levels(factor(airquality$Month))), "Set1") # numero de niveles en el factor
    names(cols) <- levels(factor(airquality$Month))
    ggplot(data = airquality, aes(x = factor(Month), y = Ozone, fill = factor(Month))) +    geom_bar(stat="identity") + 
        scale_fill_manual("legend", values = cols)  +
        xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')+guides(fill=FALSE)

    ## Warning: Removed 37 rows containing missing values (position_stack).

![](Scalas_Bars_files/figure-markdown_strict/unnamed-chunk-3-1.png)

Escala continua con *colorRampPalette* de *RcolorBrewer*

    paleta <- colorRampPalette(c("#FFFFB2", "#BD0026")) # Escala continua personalizada
    cols <- paleta(length(levels(factor(airquality$Month))))
    cuentas <- aggregate(airquality[,'Ozone' ], list(factor(airquality$Month)), mean, na.rm =TRUE)
    names(cols) <- levels(factor(airquality$Month))[order(cuentas$x)]

    ggplot(data = cuentas, aes(x = factor(Group.1), y = x, fill =factor(Group.1) )) +
            geom_bar(stat="identity") + 
            scale_fill_manual("legend", values = cols)  + theme_minimal() +  ggtitle('Gráfica colorida')+guides(fill=FALSE)

![](Scalas_Bars_files/figure-markdown_strict/unnamed-chunk-4-1.png)
