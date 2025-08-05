import { usePage } from '@inertiajs/vue3';
import type { SharedData } from '@/types/index.d.js';

export function useActive() {
    const page = usePage<SharedData>();

    const base_url = import.meta.env.VITE_APP_URL || 'https://voice.test';
    const locale = page.props.locale;
    const page_url = page.url === '/' ? '/' + locale : new URL(base_url+page.url).pathname;

    const isActive = (href:string):boolean => {

        if(href.startsWith('/')){
            href = base_url + href;
        }

        return new URL(href).pathname === page_url;
    };

    return { isActive };

}
