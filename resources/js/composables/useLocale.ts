import { usePage } from '@inertiajs/vue3';

type LocaleStrings = Record<string, Record<string, string>>;

export const locales: LocaleStrings = {
    'en': {
        'artist_status':'status',
        'all_voices':'All voices',
        'in_development':'This module is under development!',
        'back':'back',
        //order create
        'complete_order':'Complete Your Order',
        'project_title': 'Project Title',
        'project_description':'Project Description',
        'project_script':'Project Script',
        'pick_a_date':'Pick a date',
        'chosen_voices': 'Chosen voices',
        'remove_voices':'Remove Voices',
        'are_you_sure_remove_all_voices':'Are you sure you want to remove all voices from the order?',
        'clear_voices':'Clear voices',
        'clear_all_voices':'Clear all chosen voices',
        'reset_order':'reset order',
        'send':'send',
        'add_voices':'Add voices',
        'voice_added_to_cart':'The voice has been saved to your order',
        'checkout_order':'Go to order',
        'add_more_voices':'Add more voices'
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
        'logout':'Изход',
        'details':'детайли',
        'in_development':'Този модул е в процес на разработка!',
        'back':'назад',
        //order create
        'complete_order':'Оформяне на поръчката',
        'project_title': 'Име на проекта',
        'project_description': 'Описание на проекта',
        'project_script':'Текст към записа',
        'deadline':'Краен срок',
        'pick_a_date':'Изберете дата',
        'chosen_voices': 'Избрани гласове',
        'remove_voices':'Изтрий гласовете',
        'are_you_sure_remove_all_voices':'Сигурни ли сте, че желаете да изтриете всички гласове от поръчката?',
        'clear_voices':'Изтрий гласовете',
        'clear_all_voices':'Изтрий всички избрани гласове',
        'cancel':'откажи',
        'reset_order':'изтрий поръчката',
        'send':'изпрати',
        'add_voices':'добави гласове',
        'voice_added_to_cart':'Гласът е запазен в поръчката Ви',
        'checkout_order':'Към поръчката',
        'add_more_voices':'Добави още гласове'
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
