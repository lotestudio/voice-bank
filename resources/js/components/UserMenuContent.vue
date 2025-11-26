<script setup lang="ts">
import UserInfo from '@/components/UserInfo.vue';
import { DropdownMenuGroup, DropdownMenuItem, DropdownMenuLabel, DropdownMenuSeparator } from '@/components/ui/dropdown-menu';
import type { User } from '@/types';
import { Link, router } from '@inertiajs/vue3';
import { LogOut, Settings } from 'lucide-vue-next';
import profile from '@/routes/profile';
import { logout } from '@/routes';
import { computed } from 'vue';


interface Props {
    user: User;
}

const handleLogout = () => {
    router.flushAll();
};

const props = defineProps<Props>();


const isAdmin = computed(() => props.user.role === 'admin' || props.user.role === 'dev');

</script>

<template>
    <DropdownMenuLabel class="p-0 font-normal">
        <div class="flex items-center gap-2 px-1 py-1.5 text-left text-sm">
            <UserInfo :user="user" :show-email="true" />
        </div>
    </DropdownMenuLabel>
    <DropdownMenuSeparator />
    <DropdownMenuGroup>
        <DropdownMenuItem :as-child="true" v-if="isAdmin">
            <Link class="block w-full" :href="profile.edit.url()" prefetch as="button">
                <span class="i-settings"></span>
                Settings
            </Link>
        </DropdownMenuItem>
    </DropdownMenuGroup>
    <DropdownMenuSeparator v-if="user.impersonated" />
    <DropdownMenuGroup>
        <DropdownMenuItem :as-child="true" v-if="user.impersonated">
            <Link class="block w-full" href="/impersonate/leave" prefetch as="button">
                <span class="i-ghost"></span>
                Leave impersonation
            </Link>
        </DropdownMenuItem>
    </DropdownMenuGroup>
    <DropdownMenuSeparator />
    <DropdownMenuGroup>
        <DropdownMenuItem :as-child="true" v-if="isAdmin">
            <Link class="block w-full" href="/admin/dashboard" prefetch as="button">
                <span class="i-dashboard"></span>
                Admin panel
            </Link>
        </DropdownMenuItem>
    </DropdownMenuGroup>
    <DropdownMenuSeparator />
    <DropdownMenuItem :as-child="true">
        <Link class="block w-full" method="post" :href="logout.url()" @click="handleLogout" as="button">
            <span class="i-logout"></span>
            Log out
        </Link>
    </DropdownMenuItem>
</template>
