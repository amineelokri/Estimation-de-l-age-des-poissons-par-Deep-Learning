<script>
export default {
    methods: {
        smoothScroll(id) {
            document.querySelector(id).scrollIntoView({
                behavior: 'smooth'
            });
        }
    },
};

</script>

<template>
    <div
        class="py-3 px-3 mx-0 md:mx-6 lg:mx-8 lg:px-8 flex align-items-center justify-content-between relative lg:static mb-1">
        <router-link to="/"><a class="flex align-items-center" href="#"> <img src="/demo/images/logo/logo-black.png" alt="AGM Logo" height="50"
                class="mr-0 lg:mr-2" /><span class="text-900 font-medium text-2xl line-height-3 mr-8">AGM</span> </a></router-link>
        <a class="cursor-pointer block lg:hidden text-700 p-ripple" v-ripple
            v-styleclass="{ selector: '@next', enterClass: 'hidden', leaveToClass: 'hidden', hideOnOutsideClick: true }">
            <i class="pi pi-bars text-4xl"></i>
        </a>
        <div class="align-items-center flex-grow-1 justify-content-between hidden lg:flex absolute lg:static w-full left-0 px-6 lg:px-0 z-2"
            style="top: 120px">
            <ul class="list-none p-0 m-0 flex lg:align-items-center select-none flex-column lg:flex-row cursor-pointer">
                <li>
                    <router-link to="/">
                        <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                            <span>Estimer</span>
                        </a>
                    </router-link>
                </li>
                <li>
                    <router-link to="/">
                        <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                            <span>Démo</span>
                        </a>
                    </router-link>

                </li>
                <li>
                    <router-link to="/statistiques">

                        <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                            <span>Statistiques</span>
                        </a>
                    </router-link>
                </li>

                <li>
                    <router-link to="/">
                        <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                            <span>Notre Projet</span>
                        </a>
                    </router-link>
                </li>

                <li>
                    <router-link to="/">

                        <a class="flex m-0 md:ml-5 px-0 py-3 text-900 font-medium line-height-3 p-ripple" v-ripple>
                            <span>Nous</span>
                        </a>
                    </router-link>
                </li>

            </ul>
            <div
                class="flex justify-content-between lg:block border-top-1 lg:border-top-none surface-border py-3 lg:py-0 mt-3 lg:mt-0">
                <router-link to="/">
                    <Button label="estimer"
                        class="p-button-rounded border-none ml-5 font-light text-white line-height-2 bg-blue-800"
                        @click="smoothScroll('#estimer')">
                    </Button>
                </router-link>
            </div>
        </div>
    </div>
</template>

<style lang="scss" scoped></style>
