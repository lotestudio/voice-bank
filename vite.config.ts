import vue from '@vitejs/plugin-vue';
import laravel from 'laravel-vite-plugin';
import path from 'path';
import tailwindcss from "@tailwindcss/vite";
import { defineConfig } from 'vite';
import { run } from "vite-plugin-run";
import vueDevTools from 'vite-plugin-vue-devtools'
import Components from 'unplugin-vue-components/vite'


export default defineConfig({
    plugins: [
        Components({
            dirs: ['resources/js/components'],
        }),
        laravel({
            input: ['resources/js/app.js'],
            refresh: true,
        }),
        tailwindcss(),
        vue({
            template: {
                transformAssetUrls: {
                    base: null,
                    includeAbsolute: false,
                },
            },
        }),
        run([
            {
                name: "wayfinder",
                run: ["php", "artisan", "wayfinder:generate"],
                pattern: ["routes/**/*.php", "app/**/Http/**/*.php"],
            },
        ]),
        vueDevTools({
            componentInspector: true,
            launchEditor: 'phpstorm',
        })
    ],
    resolve: {
        alias: {
            '@': path.resolve(__dirname, './resources/js'),
            '@@': path.resolve(__dirname, './resources/css'),
        },
    },
});
