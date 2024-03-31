# premier fois decommenter cette partie pour intaller packages EBImage

# if (!requireNamespace("BiocManager", quietly = TRUE))
#   install.packages("BiocManager")

library("EBImage")

# Lire l'image
img <- readImage("C:/Users/ATLAS PRO ELECTRO/Desktop/plaice_right_png/plaice_right_png/6/AD_18_B76_C1_O_0016.png")


# Déterminer la dimension de l'image
h <- dim(img)[1]
w <- dim(img)[2]

# Définir la taille de la zone à extraire
d <- 512

# Coordonnées du centre de l'image
y <- w / 2
x <- h / 2

# Coordonnées du coin supérieur gauche de la zone à extraire
x1 <- x + 1
y1 <- y + 1

# Extraire la première moitié de l'image
img1 <- img[0:x, 0:w, ]

# Redimensionner la première moitié
#img1 <- resize(img1, w = d, h = d)

# Afficher la première moitié
display(img1)

# Extraire la deuxième moitié de l'image
img2 <- img[x1:h, 0:w, ]

# Redimensionner la deuxième moitié
#img2 <- resize(img2, w = d, h = d)

# Afficher la deuxième moitié
display(img2)

