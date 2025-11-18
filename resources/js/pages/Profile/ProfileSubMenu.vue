<script setup lang="ts">
import { logout } from '@/routes';
import SubMenuLayout from '@/layouts/SubMenuLayout.vue';
import { Link, router, usePage } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale';



defineProps({
    sub_page: {
        type:String,
        required:true,
    }
})
const submenu = usePage().props.menu?.profile?.children ?? [];
const handleLogout = () => {
    router.flushAll();
};

const {T} = useLocale();
</script>

<template>
    <SubMenuLayout :submenu="submenu" :title="submenu[sub_page].title">
        <template #sub_sidebar_footer>
            <hr class="my-1">
            <Link class="block w-full hover:bg-muted px-2 py-1.5 rounded text-left"
                  as="button"
                  method="post" :href="logout.url()" @click="handleLogout">
                <span class="i-logout"></span> {{T('logout')}}
            </Link>
        </template>
        <slot/>
    </SubMenuLayout>
</template>

<style scoped></style>
