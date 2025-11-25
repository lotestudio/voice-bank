<script setup lang="ts">
import {useGlobalCart } from '@/cartStore';
import {create} from '@/routes/orders';
import { Form } from '@inertiajs/vue3'


const {voices, asString} = useGlobalCart();


</script>

<template>
    <Form :action="create.url()">
        <input type="hidden" name="cart_voices" :value="asString()">
        <button class="flex items-center gap-1 p-1 border rounded-full cursor-pointer" type="submit">
            <span class="i-mic"></span>
            <div class="bg-destructive text-white rounded-full size-5 text-xs grid place-content-center">{{voices.size}}</div>
        </button>
    </Form>
</template>

<style scoped></style>
