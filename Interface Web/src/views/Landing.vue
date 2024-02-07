<script>
import CountryService from '@/service/CountryService';

export default {

    data() {
        return {
            files: [],
            totalSize: 0,
            totalSizePercent: 0,
            events: [
                { status: "Sélectionnez une image d`otlithe", text: "L'image doit être une image claire.\nPrivilégiez des images avec une résolution élevée.\nLes images doivent être au format JPEG ou PNG.", icon: 'pi pi-image', color: '#9C27B0', image: 'otolith-img.jpg' },
                { status: 'Modèle de Traitement', text: "Notre modèle d'estimation d'âge analysera l'image en utilisant des techniques avancées d'apprentissage automatique.", icon: 'pi pi-bolt', color: '#673AB7' },
                { status: 'Complétez les Informations', text: "Remplissez les champs requis pour fournir des informations contextuelles sur l'image.", icon: 'pi pi-list', color: '#FF9800' },
                { status: "Résultats de l'Estimation", text: "Découvrez l'estimation d'âge du salmon basée sur l'analyse de l'image et des informations fournies.", icon: 'pi pi-check', color: '#607D8B' }
            ],
            toggleValue: false,
            selectButtonValue1: null,
            selectButtonValues1: [{ name: 'Mâle' }, { name: 'Femelle' }, { name: 'Indéterminé' }],
            autoFilteredValue: null,
            selectedAutoValue: null,
            calendarValue: null,
            visible: false,

        };
    },
    mounted() {
        const countryService = new CountryService();
        countryService.getCountries().then((data) => (this.autoValue = data));
    },
    methods: {
        smoothScroll(id) {
            document.querySelector(id).scrollIntoView({
                behavior: 'smooth'
            });
        },
        onRemoveTemplatingFile(file, removeFileCallback, index) {
            removeFileCallback(index);
            this.totalSize -= parseInt(this.formatSize(file.size));
            this.totalSizePercent = this.totalSize / 10;
        },
        onClearTemplatingUpload(clear) {
            clear();
            this.totalSize = 0;
            this.totalSizePercent = 0;
        },
        onSelectedFiles(event) {
            this.files = event.files;
            this.files.forEach((file) => {
                this.totalSize += parseInt(this.formatSize(file.size));
            });
        },
        uploadEvent(callback) {
            this.totalSizePercent = this.totalSize / 10;
            callback();
        },
        onTemplatedUpload() {
            this.$toast.add({ severity: 'info', summary: 'Success', detail: 'File Uploaded', life: 3000 });
        },
        formatSize(bytes) {
            const k = 1024;
            const dm = 3;
            const sizes = this.$primevue.config.locale.fileSizeTypes;

            if (bytes === 0) {
                return `0 ${sizes[0]}`;
            }

            const i = Math.floor(Math.log(bytes) / Math.log(k));
            const formattedSize = parseFloat((bytes / Math.pow(k, i)).toFixed(dm));

            return `${formattedSize} ${sizes[i]}`;
        },
        searchCountry(event) {
            setTimeout(() => {
                if (!event.query.trim().length) {
                    this.autoFilteredValue = [...this.autoValue];
                } else {
                    this.autoFilteredValue = this.autoValue.filter((country) => {
                        return country.name.toLowerCase().startsWith(event.query.toLowerCase());
                    });
                }
            }, 250);
        }
    },


};
</script>

<template>
    <div class="surface-0 flex justify-content-center">
        <div id="home" class="landing-wrapper overflow-hidden">
            <div
                class="py-4 px-4 mx-0 md:mx-6 lg:mx-8 lg:px-8 flex align-items-center justify-content-between relative lg:static mb-3">
                <a class="flex align-items-center" href="#"> <img src="/demo/images/logo/logo-black.png" alt="AGM Logo"
                        height="50" class="mr-0 lg:mr-2" /><span
                        class="text-900 font-medium text-2xl line-height-3 mr-8">AGM</span> </a>
                <a class="cursor-pointer block lg:hidden text-700 p-ripple" v-ripple
                    v-styleclass="{ selector: '@next', enterClass: 'hidden', leaveToClass: 'hidden', hideOnOutsideClick: true }">
                    <i class="pi pi-bars text-4xl"></i>
                </a>
                <div class="align-items-center surface-0 flex-grow-1 justify-content-between hidden lg:flex absolute lg:static w-full left-0 px-6 lg:px-0 z-2"
                    style="top: 120px">
                    <ul
                        class="list-none p-0 m-0 flex lg:align-items-center select-none flex-column lg:flex-row cursor-pointer">
                        <li>
                            <a @click="smoothScroll('#estimer')"
                                class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                                <span>Estimer</span>
                            </a>
                        </li>
                        <li>
                            <a @click="smoothScroll('#demo')"
                                class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                                <span>Démo</span>
                            </a>
                        </li>
                        <li>
                            <router-link to="/statistiques">
                                <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                                    <span>Statistiques</span>
                                </a>
                            </router-link>
                        </li>
                        <li>
                            <a @click="smoothScroll('#about')"
                                class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                                <span>Notre Projet</span>
                            </a>
                        </li>

                        <li>
                            <a @click="smoothScroll('#about')"
                                class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                                <span>Nous</span>
                            </a>
                        </li>

                    </ul>
                    <div
                        class="flex justify-content-between lg:block border-top-1 lg:border-top-none surface-border py-3 lg:py-0 mt-3 lg:mt-0">
                        <Button label="estimer"
                            class="p-button-rounded border-none ml-5 font-light text-white line-height-2 bg-blue-800"
                            @click="smoothScroll('#estimer')">
                        </Button>
                    </div>
                </div>
            </div>


            <div id="hero" class="grid  pt-4 px-4 lg:px-8 overflow-hidden"
                style=" height:100vh ;background: linear-gradient(0deg, rgba(255, 255, 255, 0.2), rgba(255, 255, 255, 0.2)), radial-gradient(77.36% 256.97% at 77.36% 57.52%, rgb(255, 255, 255) 0%, rgb(195, 227, 250) 100%); clip-path: ellipse(150% 87% at 93% 13%)">
                <div class="col-6">
                    <h1 class="text-6xl font-bold text-gray-900 line-height-2"><span class="font-light block">AGM</span>Age
                        Generator Machine</h1>
                    <p class="font-normal text-2xl line-height-3 md:mt-3 text-gray-700">Découvrez l'âge des salmons comme
                        jamais auparavant</p>
                    <div class="mt-8">
                        <Button label="Estimer"
                            class="p-button-rounded border-none ml-5 font-light text-white line-height-2 bg-blue-800"
                            @click="smoothScroll('#estimer')"></Button>
                        <router-link to="/statistiques">
                            <Button icon="pi pi-chart-bar" label="Statistiques"
                                class="p-button-rounded border-none ml-5 font-light text-white line-height-2 bg-blue-500">
                            </Button>
                        </router-link>
                    </div>
                </div>
                <div class="col-6 ">
                    <img src="/demo/images/landing/LANDINGFISH.png" alt="Hero Image" style="height:110vh ;" />
                </div>
            </div>
            <div class="card pt-4 px-4 lg:px-8  overflow-hidden ">
                <Dialog v-model:visible="visible" modal header="Complétez les Informations" :style="{ width: '30rem' }">
                    <div class="flex flex-column align-items-center  w-full gap-1 border-bottom-1 surface-border">
                        <h5>Lieu</h5>
                        <AutoComplete placeholder="Search" id="dd" :dropdown="true" v-model="selectedAutoValue"
                            :suggestions="autoFilteredValue" @complete="searchCountry($event)" field="name" />
                        <h5>Zone</h5>
                        <AutoComplete placeholder="Search" id="dd" :dropdown="true" v-model="selectedAutoValue"
                            :suggestions="autoFilteredValue" @complete="searchCountry($event)" field="name" />
                        <h5>Date de collection</h5>
                        <Calendar :showIcon="true" :showButtonBar="true" v-model="calendarValue"></Calendar>
                        <h5>Sexe</h5>
                        <SelectButton v-model="selectButtonValue1" :options="selectButtonValues1" optionLabel="name" />
                    </div>
                    <div class="flex justify-content-end mt-4 gap-2">

                        <Button type="button" label="Cancel" severity="secondary" @click="visible = false"></Button>
                        <router-link to="/estimation">
                            <Button type="button" label="Estimer" @click="visible = false"></Button>
                        </router-link>
                    </div>
                </Dialog>
                <div class="col-12 mt-8 mb-8 p-2 md:p-8"
                    style="border-radius: 20px; background: linear-gradient(0deg, rgba(255, 255, 255, 0.6), rgba(255, 255, 255, 0.6)), radial-gradient(77.36% 256.97% at 77.36% 57.52%, #014B72 0%, #c3dcfa 100%)">
                    <div class="flex flex-column justify-content-center align-items-center text-center px-3 py-3 md:py-0">
                        <h3 class="text-gray-900 mb-2">Notre objectif</h3>
                        <p class="text-gray-900 sm:line-height-2 md:line-height-4 text-2xl mt-4" style="max-width: 800px">
                            Mettre en œuvre des techniques avancées d'apprentissage automatique pour estimer l'âge à partir
                            d'images
                        </p>
                        <img src="/demo/images/logo/logo-black.png" height="70" class="mt-4" alt="Company logo" />
                    </div>
                </div>
                <div id="estimer" class="col-12 text-center mt-8 mb-4">
                    <h2 class="text-900 font-normal mb-2">De l'Image à l'Estimation</h2>
                    <span class="text-600 text-2xl">Insérez votre image de d'otolith ici...</span>
                </div>
                <Toast />
                <FileUpload name="demo[]" url="/api/upload" @upload="onTemplatedUpload($event)" :multiple="true"
                    accept="image/*" :maxFileSize="10000000" @select="onSelectedFiles">
                    <template #header="{ chooseCallback, uploadCallback, clearCallback, files }">
                        <div class="flex flex-wrap justify-content-between align-items-center flex-1 gap-2">
                            <span class="flex gap-2 ">
                                <Button @click="chooseCallback()" icon="pi pi-images" rounded outlined></Button>
                            </span>
                            <span class="flex gap-2 ">
                                <Button @click="visible = true" icon="pi pi-cloud-upload" label="Estimer" rounded outlined
                                    severity="success" :disabled="!files || files.length === 0"></Button>
                                <Button @click="clearCallback()" icon="pi pi-times" rounded outlined severity="danger"
                                    :disabled="!files || files.length === 0"></Button>
                            </span>
                        </div>
                    </template>
                    <template #content="{ files, uploadedFiles, removeUploadedFileCallback, removeFileCallback }">
                        <div v-if="files.length > 0">
                            <h5>Pending</h5>
                            <div class="flex flex-wrap p-0 sm:p-5 gap-5 ">
                                <div v-for="(file, index) of files" :key="file.name + file.type + file.size"
                                    class="card m-0 px-6 flex flex-column border-1 surface-border align-items-center gap-3">
                                    <div>
                                        <img role="presentation" :alt="file.name" :src="file.objectURL" width="100"
                                            height="50" />
                                    </div>
                                    <span class="font-semibold">{{ file.name }}</span>
                                    <div>{{ formatSize(file.size) }}</div>
                                    <Badge value="Pending" severity="warning" />
                                    <Button icon="pi pi-times"
                                        @click="onRemoveTemplatingFile(file, removeFileCallback, index)" outlined rounded
                                        severity="danger" />
                                </div>
                            </div>
                        </div>

                        <div v-if="uploadedFiles.length > 0">
                            <h5>Completed</h5>
                            <div class="flex flex-wrap p-0 sm:p-5 gap-5">
                                <div v-for="(file, index) of uploadedFiles" :key="file.name + file.type + file.size"
                                    class="card m-0 px-6 flex flex-column border-1 surface-border align-items-center gap-3">
                                    <div>
                                        <img role="presentation" :alt="file.name" :src="file.objectURL" width="100"
                                            height="50" />
                                    </div>
                                    <span class="font-semibold">{{ file.name }}</span>
                                    <div>{{ formatSize(file.size) }}</div>
                                    <Badge value="Completed" class="mt-3" severity="success" />
                                    <Button icon="pi pi-times" @click="removeUploadedFileCallback(index)" outlined rounded
                                        severity="danger" />
                                </div>
                            </div>
                        </div>
                    </template>
                    <template #empty>
                        <div class="flex align-items-center justify-content-center flex-column">
                            <i class="pi pi-cloud-upload border-2 border-circle p-5 text-8xl text-400 border-400" />
                            <p class="mt-4 mb-0">Drag and drop images to here.</p>
                        </div>
                    </template>
                </FileUpload>

            </div>
            <div id="demo" class="card" style="background-color:#014B72;">
                <div class="text-center mb-5">
                    <h2 class="text-900 font-normal mb-2 text-blue-50">Powerful Everywhere</h2>
                    <span class="text-600 text-2xl text-blue-50 ">Amet consectetur adipiscing elit...</span>
                </div>
                <Timeline :value="events" align="alternate" class="customized-timeline">
                    <template #marker="slotProps">
                        <span
                            class="flex w-2rem h-2rem align-items-center justify-content-center text-white border-circle z-1 shadow-1"
                            style="background-color: #015a72; ">
                            <i :class="slotProps.item.icon"></i>
                        </span>
                    </template>
                    <template #content="slotProps">
                        <Card class="mt-3 " style="background-color: #02507a; color: #dfebfa; ">
                            <template #title>
                                {{ slotProps.item.status }}
                            </template>
                            <template #content>
                                <img v-if="slotProps.item.image" :src="`/demo/images/landing/${slotProps.item.image}`"
                                    :alt="slotProps.item.name" width="200" class="shadow-1" />
                                <p style="color: #d4e7fe;">
                                    {{ slotProps.item.text }}
                                </p>
                            </template>
                        </Card>
                    </template>
                </Timeline>
            </div>

            <div id="about" class="py-4 px-4 lg:px-8 mx-0 my-6 lg:mx-8">
                <div class="grid mt-8 pb-2 md:pb-8">
                    <div class="flex justify-content-center col-12 lg:col-6 bg-blue-100 p-0 flex-order-1 lg:flex-order-0"
                        style="border-radius: 8px">
                        <img src="/demo/images/landing/equipe.webp" class="w-11" alt="mockup mobile" />
                    </div>

                    <div class="col-12 lg:col-6 my-auto flex flex-column lg:align-items-end text-center lg:text-right">
                        <div class="flex align-items-center justify-content-center bg-blue-100 align-self-center lg:align-self-end"
                            style="width: 4.2rem; height: 4.2rem; border-radius: 10px;">
                            <i class="pi pi-fw pi-users text-5xl text-blue-800"></i>
                        </div>
                        <h2 class="line-height-1 text-900 text-4xl font-normal">Nous sommes</h2>
                        <span class="text-700 text-2xl line-height-3 ml-0 md:ml-2" style="max-width: 650px">une équipe
                            d'étudiants en deuxième année du cycle ingénieur à l'Ecole d'Ingénieurs du littoral Côte
                            d'Opale.<br>Ce projet ambitieux sous la direction éclairée de notre enseignante, Madame Emilie
                            Poisson Caillault.</span>
                    </div>
                </div>

                <div class="grid my-8 pt-2 md:pt-8">
                    <div class="col-12 lg:col-6 my-auto flex flex-column text-center lg:text-left lg:align-items-start">
                        <div class="flex align-items-center justify-content-center  align-self-center lg:align-self-start"
                            style="width: 4.2rem; height: 4.2rem; border-radius: 10px;background-color:#014B72;">
                            <i class="pi pi-fw pi-sun text-5xl text-blue-200"></i>
                        </div>
                        <h2 class="line-height-1 text-900 text-4xl font-normal">Notre Projet</h2>
                        <span class="text-700 text-2xl line-height-3 mr-0 md:mr-2" style="max-width: 650px">Notre objectif
                            est de mettre en œuvre des techniques avancées d'apprentissage automatique pour estimer l'âge à
                            partir d'images. Ce projet allie la théorie à la pratique, nous permettant d'appliquer les
                            connaissances acquises au cours de notre cursus académique à une application concrète et
                            innovante.</span>
                    </div>

                    <div class="flex justify-content-end flex-order-1 sm:flex-order-2 col-12 lg:col-6 p-0"
                        style="background-color:#014B72;border-radius: 8px">
                        <img src="/demo/images/landing/Collab-bro.png" class="w-11" alt="mockup" />
                    </div>
                </div>
            </div>

            <div class=" footer py-8 px-8 mx-0 mt-8 " style="background-color:#014B72; ">
                <div class="grid justify-content-between">
                    <div class="col-12 md:col-2" style="margin-top: -1.5rem">
                        <a @click="smoothScroll('#home')"
                            class="flex flex-wrap align-items-center justify-content-center md:justify-content-start md:mb-0 mb-3 cursor-pointer">
                            <img src="/demo/images/logo/logo-white.png" alt="footer sections" width="50" height="50"
                                class="mr-2" />
                            <h4 class="font-medium text-3xl ">AGM</h4>
                        </a>
                    </div>

                    <div class="col-12 md:col-10 lg:col-7">
                        <div class="grid text-center md:text-left">
                            <div class="col-12 md:col-3 ">
                                <h4 class="font-medium text-2xl line-height-3 mb-3 text-900">À propos</h4>
                                <a @click="smoothScroll('#about')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Notre Projet</a>
                                <a @click="smoothScroll('#about')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Nous </a>
                            </div>

                            <div class="col-12 md:col-3 mt-4 md:mt-0">
                                <h4 class="font-medium text-2xl line-height-3 mb-3 text-900">Service</h4>
                                <a @click="smoothScroll('#demo')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Demo</a>
                                <a @click="smoothScroll('#estimer')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Estimer</a>
                                <router-link to="/statistiques">
                                    <a class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Statistiques</a>
                                </router-link>
                            </div>

                            <div class="col-12 md:col-3 mt-4 md:mt-0">
                                <h4 class="font-medium text-2xl line-height-3 mb-3 text-900">Contact</h4>
                                <a @click="smoothScroll('#hero')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">LinkedIn</a>
                                <a @click="smoothScroll('#hero')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Mail</a>

                            </div>

                            <div class="col-12 md:col-3 mt-4 md:mt-0">
                                <h4 class="font-medium text-2xl line-height-3 mb-3 text-900">Legal</h4>
                                <a @click="smoothScroll('#hero')"
                                    class="line-height-3 text-xl block cursor-pointer mb-2 text-700">Privacy Policy</a>
                                <a @click="smoothScroll('#hero')"
                                    class="line-height-3 text-xl block cursor-pointer text-700">Terms of Service</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <AppConfig simple />
</template>

<style scoped>
.footer h4 {
    color: #dcf3ff !important;
}

.footer a {
    color: #b7d7e9 !important;
}
</style>