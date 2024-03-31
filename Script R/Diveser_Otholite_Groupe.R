library("EBImage")

# Chemin vers le dossier contenant les images
input_folder <- "C:/Users/ATLAS PRO ELECTRO/Desktop/plaice_right_png/plaice_right_png/14"

# Création des dossiers de sortie s'ils n'existent pas déjà
output_folder_right <- "C:/Users/ATLAS PRO ELECTRO/Desktop/images divesee/Right/"
output_folder_left <- "C:/Users/ATLAS PRO ELECTRO/Desktop/images divesee/Left/"

# Liste de fichiers dans le dossier d'entrée
image_files <- list.files(input_folder, full.names = TRUE)

# Taille de la zone à extraire
d <- 512

# Boucle à travers chaque image
for (file in image_files) {
  # Lire l'image
  img <- readImage(file)
  
  # Déterminer les dimensions de l'image
  h <- dim(img)[1]
  w <- dim(img)[2]
  
  # Coordonnées du centre de l'image
  y <- w / 2
  x <- h / 2
  
  # Coordonnées du coin supérieur gauche de la zone à extraire
  x1 <- max(1, x - d/2)  # Assure que l'indice ne soit pas en dehors des limites de l'image
  y1 <- max(1, y - d/2)  # Assure que l'indice ne soit pas en dehors des limites de l'image
  
  # Extraire la première moitié de l'image
  img_left <- img[0:x, 0:w, ]
  
  # Redimensionner la première moitié
  #img_left <- resize(img_left, w = d, h = d)
  
  # Extraire la deuxième moitié de l'image
  img_right <- img[x1:h, 0:w, ]
  
  # Redimensionner la deuxième moitié
  #img_right <- resize(img_right, w = d, h = d)
  
  # Enregistrer les moitiés gauche et droite dans les dossiers respectifs
  file_name <- basename(file)
  output_file_left <- paste0(output_folder_left, file_name)
  output_file_right <- paste0(output_folder_right, file_name)
  
  writeImage(img_left, output_file_left)
  writeImage(img_right, output_file_right)
}

