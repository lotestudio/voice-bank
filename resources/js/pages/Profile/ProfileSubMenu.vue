<script setup lang="ts">
import { logout } from '@/routes';
import SubMenuLayout from '@/layouts/SubMenuLayout.vue';
import { Link, router, usePage } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale';
import { computed } from 'vue';
defineProps({
    sub_page: {
        type: String,
        required: true,
    },
});
const submenu = usePage().props.menu?.profile?.children ?? [];
const handleLogout = () => {
    router.flushAll();
};

const { T } = useLocale();

const user = usePage().props.auth.user;
const isAdmin = computed(() => user.role === 'admin' || user.role === 'dev');
</script>

<template>
    <SubMenuLayout :submenu="submenu" :title="submenu[sub_page].title">
        <template #sub_sidebar_footer>
            <hr class="my-1" />
            <Link
                class="flex gap-4 items-center w-full rounded px-2 py-1.5 text-left hover:bg-muted"
                as="button"
                method="post"
                :href="logout.url()"
                @click="handleLogout"
            >
                <span class="i-logout"></span> {{ T('logout') }}
            </Link>

            <Link
                  class="flex gap-4 items-center w-full rounded px-2 py-1.5 text-left hover:bg-muted"
                  v-if="isAdmin"
                  href="/admin/dashboard"
                  prefetch
                  as="button"
            >
                <span class="i-dashboard"></span>
                Admin panel
            </Link>

            <Link
                v-if="user.impersonated"
                class="flex gap-4 items-center w-full rounded px-2 py-1.5 text-left hover:bg-muted"
                href="/impersonate/leave" as="button"
            >
                <span class="i-ghost"></span>
                Leave impersonation
            </Link>
        </template>
        <slot />
    </SubMenuLayout>
</template>

<style scoped></style>
