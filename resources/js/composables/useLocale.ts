import { usePage } from '@inertiajs/vue3';

type LocaleStrings = Record<string, Record<string, string>>;

export const locales: LocaleStrings = {
    'en': {
        'artist_status':'status',
        'all_voices':'All voices',

    },
    'bg': {
        'price':'цена',
        'order':'запази',
        'no available demo dile':'няма наличен демо файл',
        'name':'Име',
        'message':'Съобщение',
        'become an artist': 'Стани диктор',
        'all filters': 'Всички филтри',
        'search': 'Търси',
        'artist_status':'наличност',
        'from':'oт',
        'orders':'поръчки',
        'all_voices':'Разгледай всички',
        'logout':'Изход'

    }
};



export function useLocale() {

    const page = usePage();


    const locale:string = page.props.locale as string;


    const t = (key: string): string => {
        if (!locales[locale] || !(key in locales[locale])) {
            return key;
        }
        return locales[locale][key];
    };

    const T = (key: string): string =>{
        return capitalize(t(key));
    }
    const capitalize=(string:string)=>{
        if(typeof string!=='string') return '';
        return string.charAt(0).toUpperCase()+string.slice(1);
    }

    const shorten = (str:string, maxLen:number, separator = ' ')=>{
        if (!str) {
            return 'undefined';
        }

        if (str.length <= maxLen) return str;
        const lastSeparatorIndex = str.lastIndexOf(separator, maxLen);
        return lastSeparatorIndex === -1 ? str.slice(0, maxLen) + '...' : str.slice(0, lastSeparatorIndex) + '...';
    }

    const locale_url = (url:string)=>{
        if(!url.startsWith('/')){
            url = '/'+url;
        }
        return '/'+page.props.locale+url
    }

    return {T,t, shorten, locale_url};

}
