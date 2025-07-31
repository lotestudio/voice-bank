

export const locales = {
    'en': {
        'contacts':'contacts',
        'demos':'demos',
        'voices':'voices',
        'home': 'home',
        'about': 'about',
        'sex':'gender',
        'locale':'language',

    },
    'bg': {
        'contacts':'контакти',
        'demos':'проекти',
        'voices':'гласове',
        'home': 'начало',
        'about': 'за нас',
        'The site is under construction!': 'Сайтът е в процес на разработка!',
        'male':'мъжки',
        'female':'женски',
        'all': 'всички',
        'sex': 'пол',
        'locale':'език',
        'reset':'всички',
        'send':'изпрати',
        'name':'име',
        'message':'съобщение'
    }
};



export function useLocale() {
    const t = (key,locale)=>{
        return locales[locale][key] || key;
    }

    const T = (key,locale) =>{
        return capitalize(t(key,locale));
    }
    const capitalize=(string)=>{
        if(typeof string!=='string') return '';
        return string.charAt(0).toUpperCase()+string.slice(1);
    }

    const shorten = (str, maxLen, separator = ' ')=>{
        if (!str) {
            return 'undefined';
        }

        if (str.length <= maxLen) return str;
        const lastSeparatorIndex = str.lastIndexOf(separator, maxLen);
        return lastSeparatorIndex === -1 ? str.slice(0, maxLen) + '...' : str.slice(0, lastSeparatorIndex) + '...';
    }


    return {T,t, shorten};

}
