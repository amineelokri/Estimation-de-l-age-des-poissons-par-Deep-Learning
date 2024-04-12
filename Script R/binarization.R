library("png")
library(imager)
library(EBImage)

img1<-readPNG("C:/Users/ATLAS PRO ELECTRO/Desktop/plaice_right_png/plaice_right_png/6/AD_18_B76_C1_O_0016.png")
#fonction d affichage
display<-function(...){
  
  imageList<-list(...) ;   totalWidth<-0 ;   maxHeight<-0 ;   
  
  for (img in imageList){    if(is.character(img)) img<-readPNG(img) ;  dimg<-dim(img) ;  totalWidth<-totalWidth+dimg[2] ;   maxHeight<-max(maxHeight,dimg[1])  }
  
  par(mar=c(0,0,0,0)) ;   plot(c(0,totalWidth),c(0,maxHeight),type="n",asp=1,xaxt="n",yaxt="n",xlab="x",ylab="y") ;   offset<-0 ; 
  
  for (img in imageList){    dimg<-dim(img) ;    rasterImage(img,offset,0,offset+dimg[2],dimg[1])
  
  offset<-offset+dimg[2]  }}

#fonction d histograme
hist_img <- function(img){
  red <- as.vector(img[,,1])*255
  green <- as.vector(img[,,2])*255
  blue <- as.vector(img[,,3])*255
  densite_red <- density(red)
  densite_green <- density(green)
  densite_blue <- density(blue)
  y_max <- max(c(densite_red$y,densite_blue$y,densite_green$y))
  plot(red,type="n",xlim=c(0,255),ylim=c(0,y_max),ylab="Fréquence",xlab="Intensité",main=names(img))
  lines(densite_red, col = "red",lwd=3) # Superposer la ligne rouge
  lines(densite_green, col = "green",lwd=3) # Superposer la ligne verte
  lines(densite_blue, col = "blue",lwd=3) # Superposer la ligne bleue
  grid() }

#amiliorer la qualiter
df <- data.frame(R = as.vector(img1[,,1]),
                 
                 V = as.vector(img1[,,2]),
                 
                 B = as.vector(img1[,,3]))

pca <- prcomp(df)

pca$x[,1]<-pca$x[,1]-min(pca$x[,1])

pca$x[,1]<-pca$x[,1]*1/max(pca$x[,1])

hist(pca$x[,1])

img2 <- img1

img2[,,1] <- array(as.vector(t(pca$x[,1])), dim = c(nrow(img1), ncol(img1), 1))

img2[,,2] <- array(as.vector(t(pca$x[,1])), dim = c(nrow(img1), ncol(img1), 1))

img2[,,3] <- array(as.vector(t(pca$x[,1])), dim = c(nrow(img1), ncol(img1), 1))


# Low pass filter with gblur and make binary
dm <- dim(img2)/96
dev.new(width = dm[1], height = dm[2])
xb <- gblur(img2, 3)
xt <- thresh(xb, offset = 0.0001)
display(xt)

# Keep only "large" objects
xm <- bwlabel(xt)

plot(xm) # trimmed.jpg


#supplémentaire
y = opening(xt, makeBrush(5, shape='disc'))
display(y)

cols = c('black', sample(rainbow(max(z))))
zrainbow = Image(cols[1+z], dim=dim(z))
display(zrainbow, title='Cell nuclei (recolored)', all=TRUE)
