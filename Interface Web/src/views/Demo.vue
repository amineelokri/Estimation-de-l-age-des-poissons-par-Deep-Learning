<template>
    <div class="card">
        <div class="card-title">
            <h4 class="text-blue-800">Démonstration de site web</h4>
        </div>
        <Accordion :activeIndex="0">
            <AccordionTab header="Description de projet">
                <p class="m-0">
                    Ce projet vise à analyser et à modéliser les données sur les poissons, en se concentrant sur la
                    relation entre la taille, le poids et l'âge. Il comprend des scripts Python et R pour nettoyer les
                    données, entraîner des modèles, diviser les images et effectuer des analyses statistiques, ainsi que
                    des fichiers CSV contenant les métadonnées après le nettoyage.
                </p>
            </AccordionTab>
            <AccordionTab header="Estimation">
                <p class="m-0">
                    Sélectionnez une image claire et de haute résolution de l'otolithe pour le modèle de traitement.
                    L'image choisie sera de préférence au format JPEG ou PNG. Le modèle d'estimation d'âge utilisera des
                    techniques avancées d'apprentissage automatique pour analyser l'image et prédire l'âge du poisson.
                    Une fois l'analyse effectuée, les résultats de l'estimation d'âge du saumon seront disponibles,
                </p>
            </AccordionTab>
            <AccordionTab header="Statistiques">
                <p class="m-0">
                    Les données statistiques fournies offrent un aperçu global de la population de poissons étudiée.
                    Elles incluent des mesures clés telles que l'âge moyen total des poissons, la répartition de l'âge
                    par sexe, le nombre de poissons par sexe, ainsi que des pourcentages relatifs à la répartition des
                    poissons dans différents environnements. Ces statistiques permettent de comprendre la démographie
                    générale de la population de poissons, ainsi que ses préférences environnementales. En combinant ces
                    données, il est possible d'avoir une vision plus complète de la dynamique de la population de
                    poissons étudiée.
                </p>
            </AccordionTab>
        </Accordion>
    </div>
    <div class="card">
        <div class="card-title">
            <h4 class="text-blue-800">Apprentissage automatique</h4>
        </div>
        <Panel header="Données d'entraînement, de validation et de test" toggleable>
            <p class="m-0">
                Les données d'entraînement, de validation et de test sont les trois ensembles principaux utilisés dans
                le processus de développement et d'évaluation des modèles d'apprentissage automatique.
                <br><br>
                <b>Données d'entraînement :</b> Ces données sont utilisées pour entraîner le modèle, c'est-à-dire pour
                ajuster les poids des paramètres du modèle afin qu'il puisse apprendre à partir des données et faire des
                prédictions. Pour notre cas, la taille des données d'entraînement est de 70% de l’ensemble des données.
                <br><br>
                <b>Données de validation :</b> Ces données sont utilisées pour évaluer les performances du modèle
                pendant l'entraînement et pour prendre des décisions sur les hyperparamètres du modèle, tels que le taux
                d'apprentissage ou la taille du lot. Les données de validation sont utilisées pour surveiller la
                capacité du modèle à généraliser aux données inconnues tout en évitant le surajustement. Pour notre cas,
                la taille des données de validation est de 20% de l’ensemble des données.
                <br><br>
                <b>Données de test :</b> Une fois que le modèle a été entraîné et validé sur les données d'entraînement
                et de validation, il est évalué sur les données de test pour obtenir une estimation impartiale de sa
                performance finale.
            </p>
        </Panel>
        <br>

        <Panel header="Modèles d'apprentissage profond pour segmenter les images" toggleable>
            <p class="m-0">
                Les algorithmes d'apprentissage approfondi utilisés pour segmenter les otolithes afin d'estimer l'âge
                des poissons sont :
                <br><br>
                <b>U-Net :</b> Il utilise une architecture en forme de U qui combine des couches de contraction
                (encodeurs) et d'expansion (décodeurs) pour capturer à la fois les caractéristiques globales et locales
                de l'image.
            </p>
            <Image src="/demo/images/demo/unet.png" alt="Image" width="250" preview />

            <p class="m-0">
                <b>Mask R-CNN :</b> Basé sur l'architecture R-CNN, Mask R-CNN ajoute une branche de segmentation aux
                régions d'intérêt détectées par le réseau. Cela permet de générer des masques de segmentation précis
                pour chaque instance d'objet dans une image.
            </p>
            <Image src="/demo/images/demo/rcnn.png" alt="Image" width="250" preview />

            <p class="m-0">
                <b>FCN (Fully Convolutional Network) :</b> FCN prédit une carte de segmentation pixel par pixel. Il
                utilise des couches de convolution transposables (ou des upsampling layers) pour agrandir
                progressivement la carte de segmentation.
            </p>

            <Image src="/demo/images/demo/fcn.png" alt="Image" width="250" preview />

        </Panel>
        <br>
        <Panel header="Performance du modèle" toggleable>
            <p class="m-0">
                Nous avons entraîné notre modèle sur un certain nombre d'epochs, où un epoch représente une seule passe
                complète de l'ensemble des données d'entraînement à travers le modèle. Après chaque epoch (ou après
                plusieurs epochs), le modèle peut être évalué sur un ensemble de données de validation pour observer son
                comportement sur des données qu'il n'a pas rencontrées pendant l'entraînement. En réalité, notre modèle
                est très complexe et la base de données est très volumineuse, ce qui signifie que le modèle nécessite
                beaucoup de temps pour l'entraînement. Pour cette raison, nous avons initialement choisi un nombre
                d'epochs relativement petit (10 epochs) afin d'observer le comportement du modèle..
            </p>
        </Panel>
    </div>
</template>

<script>
</script>
