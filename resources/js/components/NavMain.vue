<script setup lang="ts">
import { SidebarGroup, SidebarGroupLabel, SidebarMenu, SidebarMenuButton, SidebarMenuItem,SidebarMenuSubButton,SidebarMenuSubItem,SidebarMenuSub } from '@/components/ui/sidebar';
import { Link } from '@inertiajs/vue3';
import { useActive } from '@/composables/useActive';
import { Collapsible,CollapsibleTrigger,CollapsibleContent } from '@/components/ui/collapsible';

defineProps<{
    items: object;
}>();

const { isActive } = useActive();
</script>

<template>
    <SidebarGroup class="px-2 py-0">
        <SidebarMenu>
            <SidebarMenuItem v-for="item in items" :key="item.title">
                <SidebarMenu v-if="item.children">
                    <Collapsible
                        :key="item.title"
                        as-child
                        :default-open="item.isActive"
                        class="group/collapsible"
                    >
                        <SidebarMenuItem>
                            <CollapsibleTrigger as-child>
                                <SidebarMenuButton :tooltip="item.title">
                                    <span>{{ item.title }}</span>
                                    <span class="ml-auto i-chevronRight transition-transform duration-200 group-data-[state=open]/collapsible:rotate-90" />
                                </SidebarMenuButton>
                            </CollapsibleTrigger>
                            <CollapsibleContent>
                                <SidebarMenuSub>
                                    <SidebarMenuSubItem v-for="subItem in item.children" :key="subItem.title">
                                        <SidebarMenuSubButton as-child>
                                            <Link :href="subItem.href">
                                                <span>{{ subItem.title }}</span>
                                            </Link>
                                        </SidebarMenuSubButton>
                                    </SidebarMenuSubItem>
                                </SidebarMenuSub>
                            </CollapsibleContent>
                        </SidebarMenuItem>
                    </Collapsible>
                </SidebarMenu>


                <SidebarMenuButton v-else as-child :is-active="isActive(item.href)" :tooltip="item.title">
                    <Link :href="item.href">
                        <span v-if="item.icon" :class="item.icon"></span>
                        <span>{{ item.title }}</span>
                    </Link>
                </SidebarMenuButton>
            </SidebarMenuItem>
        </SidebarMenu>
    </SidebarGroup>
</template>
