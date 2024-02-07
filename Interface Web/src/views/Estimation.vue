<script >
export default {
    data() {
        return {
            value: null
        }
    }
};</script>

<template>
    <div class="card">
   <div class="grid grid-nogutter surface-section text-800 " style="height: 72vh;" >
    <div class="col-12 md:col-6 p-6 text-center md:text-left flex align-items-center ">
        <section>
            <span class="block text-6xl font-bold mb-4">Estimation d'Age est: </span>
            <div class="text-6xl text-blue-800 font-bold ">567</div>
            <p class="mt-0 mb-4 text-700 line-height-3">jours</p>
            <div class="mt-4">
                <Rating v-model="value" />
            </div>
        </section>
    </div>
    <div class="col-12 md:col-6 overflow-hidden" style="height: 100%;">
        <img src="/demo/images/landing/salmon-img.jpg" alt="salmon-img" class="md:ml-auto block " style=" clip-path: polygon(8% 0, 100% 0%, 100% 100%, 0 100%)" />
    </div>
</div>
</div>
</template>
