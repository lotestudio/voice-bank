<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import BackButton from '@/components/BackButton.vue';
import HeadingSmall from '@/components/HeadingSmall.vue';
import Voice from '@/components/Site/Order/Voice.vue';
import { computed } from 'vue';

const page = usePage();
const order = computed(() => page.props.order);
const findReview = (voice_id: number) => {
    return order.value.reviews?.find(review => review.voice_id === voice_id) ?? null;
};

</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="orders">
            <div class="space-y-8">
                <HeadingSmall :title="order.title" :description="order.description" />

                <div>
                    <h3 class="mb-0.5 text-base font-medium">Voice Cast:</h3>
                </div>

                <div v-for="voice in order.voices" :key="voice.id" class="space-y-4">
                    <Voice
                        :voice="voice"
                        :order_id="order.id"
                        :review="findReview(voice.id)"
                    />
                </div>
                <BackButton />
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
