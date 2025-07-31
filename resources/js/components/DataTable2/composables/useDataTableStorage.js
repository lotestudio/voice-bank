import {useStorage} from "@vueuse/core";

export function useDataTableStorage(defaultUrl,defaultUrlParams){

    const state = useStorage(
        defaultUrl,

        {
            columns:[],
            columnsVisibility:[],
            urlParams: {
                'search':'',
                'json':true,
            }
        },
        localStorage,
        { mergeDefaults: true } // <--
    )

    const resetState = () => {

        state.value= {
            columns:[],
            columnsVisibility:[],
            urlParams: {
                'search':'',
                'json':true,
            }
        }

        setDefaultUrlParams();
    }

    const setDefaultUrlParams = () => {
        defaultUrlParams.forEach((param) => {
            let key = (Object.keys(param)[0]);
            state.value.urlParams[key] = param[key];
        })
    }


    return {
        state,
        resetState,
        setDefaultUrlParams
    }
}
