library(EBImage)
# Installation du package imager
#install.packages("imager")
# Chargement du package imager
library(imager)
# Chargement de l'image
image_files <- readImage("C:/Users/ATLAS PRO ELECTRO/Desktop/plaice_right_png/plaice_right_png/6/AD_18_B76_C1_O_0016.png")
# Assurez-vous que la bibliothèque imager est installée
# Vous pouvez l'installer en exécutant : install.packages("imager")

# Conversion de l'image en niveaux de gris
gray_image <- grayscale(image_files)

# Application du filtre de Sobel
sobel_image <- imager::sobel(gray_image)

# Affichage de l'image originale et de l'image avec le filtre de Sobel
par(mfrow = c(1, 2))
plot(image_files, main = "Image originale")
plot(sobel_image, main = "Filtre de Sobel")
