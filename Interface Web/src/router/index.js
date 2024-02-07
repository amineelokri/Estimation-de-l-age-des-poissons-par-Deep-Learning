import { createRouter, createWebHashHistory } from 'vue-router';
import AppLayout from '@/layout/AppLayout.vue';


const router = createRouter({
    history: createWebHashHistory(),
    routes: [
        {
            path: '/',
            name: 'landing',
            component: () => import('@/views/Landing.vue')
        },
        {
            
            path: '/',
            component: AppLayout,
            children: [
                {
                    path: '/estimation',
                    name: 'estimation',
                    component: () => import('@/views/Estimation.vue')
                },
                {
                    path: '/statistiques',
                    name: 'statistiques',
                    component: () => import('@/views/statistiques.vue')
                },
            ]
        },
        {
            path: "/:notFound",
            name: 'notfound',
            component: () => import('@/views/NotFound.vue')
        }
    ]
});

export default router;
