import { usePage } from '@inertiajs/vue3';

type LocaleStrings = Record<string, Record<string, string>>;

export const locales: LocaleStrings = {
    'en': {

    },
    'bg': {
        'price':'цена',
        'order':'запази',
        'no available demo dile':'няма наличен демо файл',
        'name':'Име',
        'message':'Съобщение',
        'become an artist': 'Стани диктор',
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


    return {T,t, shorten};

}
