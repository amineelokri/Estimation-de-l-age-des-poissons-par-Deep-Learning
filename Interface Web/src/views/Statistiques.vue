<script setup>
import { ref, watch } from 'vue';
import { useLayout } from '@/layout/composables/layout';
import { info } from '@/service/fisher_info.json'

const { layoutConfig } = useLayout();
let documentStyle = getComputedStyle(document.documentElement);
let textColor = documentStyle.getPropertyValue('--text-color');
let textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
let surfaceBorder = documentStyle.getPropertyValue('--surface-border');
const statistique = info;

const pieData = ref(null);
const pieData2 = ref(null);
const pieOptions = ref(null);
const setColorOptions = () => {
    documentStyle = getComputedStyle(document.documentElement);
    textColor = documentStyle.getPropertyValue('--text-color');
    textColorSecondary = documentStyle.getPropertyValue('--text-color-secondary');
    surfaceBorder = documentStyle.getPropertyValue('--surface-border');
};
//const productService = new ProductService();
const setChart = () => {
    pieData.value = {
        labels: ['Mâle', 'Femelle', 'Indéterminé'],
        datasets: [
            {
                data: [statistique.nombres_par_sexe.M, statistique.nombres_par_sexe.F, statistique.nombres_par_sexe.I],
                backgroundColor: [documentStyle.getPropertyValue('--indigo-500'), documentStyle.getPropertyValue('--purple-500'), documentStyle.getPropertyValue('--teal-500')],
                hoverBackgroundColor: [documentStyle.getPropertyValue('--indigo-400'), documentStyle.getPropertyValue('--purple-400'), documentStyle.getPropertyValue('--teal-400')]
            }
        ]
    };
    pieData2.value = {
        labels: ['Eau douce 1-5 ans', 'Océan 5-6 ans', 'Retour en eau douce > 7ans'],
        datasets: [
            {
                data: [statistique.pourcentage_intervalle_age.eau_douce, statistique.pourcentage_intervalle_age.ocean, statistique.pourcentage_intervalle_age.retour_en_eau_douce],
                backgroundColor: [documentStyle.getPropertyValue('--indigo-500'), documentStyle.getPropertyValue('--purple-500'), documentStyle.getPropertyValue('--teal-500')],
                hoverBackgroundColor: [documentStyle.getPropertyValue('--indigo-400'), documentStyle.getPropertyValue('--purple-400'), documentStyle.getPropertyValue('--teal-400')]
            }
        ]
    };

    pieOptions.value = {
        plugins: {
            legend: {
                labels: {
                    usePointStyle: true,
                    color: textColor
                }
            }
        }
    };
};

watch(
    layoutConfig.theme,
    () => {
        setColorOptions();
        setChart();
    },
    { immediate: true }
);

</script>

<template>
    <div class="grid">
        <div class="col-12 lg:col-6 xl:col-3">
            <div class="card mb-0">
                <div class="flex justify-content-between mb-3">
                    <div>
                        <span class="block text-500 font-medium mb-3">échantillons</span>
                        <div class="text-900 font-medium text-xl">{{statistique.nombre_lignes}}</div>
                    </div>
                    <div class="flex align-items-center justify-content-center bg-blue-100 border-round"
                        style="width: 2.5rem; height: 2.5rem">
                        <i class="pi pi-folder-open text-blue-500 text-xl"></i>
                    </div>
                </div>
                <span class="text-green-500 font-medium">2010-2019</span>
                <span class="text-500"> Metadata_plaice</span>
            </div>
        </div>
        <div class="col-12 lg:col-6 xl:col-3">
            <div class="card mb-0">
                <div class="flex justify-content-between mb-3">
                    <div>
                        <span class="block text-500 font-medium mb-3">Moyenne d'age</span>
                        <div class="text-900 font-medium text-xl">{{statistique.moyenne_age_total}}</div>
                    </div>
                    <div class="flex align-items-center justify-content-center bg-orange-100 border-round"
                        style="width: 2.5rem; height: 2.5rem">
                        <i class="pi pi-chart-pie text-orange-500 text-xl"></i>
                    </div>
                </div>
                <span class="text-green-500 font-medium">{{statistique.moyenne_age_total*365}}j </span>
                <span class="text-500"></span>
            </div>
        </div>
        <div class="col-12 lg:col-6 xl:col-3">
            <div class="card mb-0">
                <div class="flex justify-content-between mb-3">
                    <div>
                        <span class="block text-500 font-medium mb-3">Moyenne d'age F</span>
                        <div class="text-900 font-medium text-xl">{{statistique.moyenne_age_sexe.F}}</div>
                    </div>
                    <div class="flex align-items-center justify-content-center bg-cyan-100 border-round"
                        style="width: 2.5rem; height: 2.5rem">
                        <i class="pi pi-chart-pie text-cyan-500 text-xl"></i>
                    </div>
                </div>
                <span class="text-green-500 font-medium">{{statistique.nombres_par_sexe.F}} </span>
                <span class="text-500"> échantillons</span>
            </div>
        </div>
        <div class="col-12 lg:col-6 xl:col-3">
            <div class="card mb-0">
                <div class="flex justify-content-between mb-3">
                    <div>
                        <span class="block text-500 font-medium mb-3">Moyenne d'age M</span>
                        <div class="text-900 font-medium text-xl">{{statistique.moyenne_age_sexe.M}}</div>
                    </div>
                    <div class="flex align-items-center justify-content-center bg-purple-100 border-round"
                        style="width: 2.5rem; height: 2.5rem">
                        <i class="pi pi-chart-pie text-purple-500 text-xl"></i>
                    </div>
                </div>
                <span class="text-green-500 font-medium">{{statistique.nombres_par_sexe.M}} </span>
                <span class="text-500"> échantillons</span>
            </div>
        </div>
        <div class="col-12 xl:col-6">
            <div class="card flex flex-column align-items-center">
                <h5 class="text-left w-full">L'intervalle d'âge</h5>
                <Chart type="pie" :data="pieData" :options="pieOptions"></Chart>
            </div>
        </div>
        <div class="col-12 xl:col-6">
            <div class="card flex flex-column align-items-center">
                <h5 class="text-left w-full">Sexe</h5>
                <Chart type="doughnut" :data="pieData2" :options="pieOptions"></Chart>
            </div>
        </div>

    </div>
</template>
