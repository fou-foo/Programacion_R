
library(ggplot2)
airquality # datos prueba
ggplot(data = airquality, aes(x = factor(Month), y = Ozone, fill = factor(Month))) + #indicas la variable de agrupamiento -debe ser tipo factor- y la de interes, tambien requieres llenar el parametro 'fill' con la variable con la que agrupa 
	geom_bar(stat="identity") +   # se construyen las barras
	scale_fill_brewer(palette = 'RdPu')+ # la magia de poder escoger facíl el color de la escala 'continua' o discreta
	xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')+  #demas cosas
	guides(fill=FALSE) #quitar leyenda



##########
iris2 <- iris
cols <- brewer.pal(3, "RdPu")
names(cols) <- levels(iris2$Species)
iris2$color <- cols[iris2$Species] 
ggplot(data = iris2, aes(x = Species, y = Sepal.Length, fill = Species)) + 
	geom_bar(stat="identity") + 
	scale_fill_manual("legend", values = cols)	+
	xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')+
     guides(fill=FALSE)


##########
ggplot(data = iris2, aes(x = Species, y = Sepal.Length)) + 
geom_bar(stat="identity") + 
scale_fill_gradient(low = "green", high = "red")+
xlab('cambiando color por escala') + theme_minimal() +  ggtitle('Gráfica colorida')
+ guides(fill=FALSE)




