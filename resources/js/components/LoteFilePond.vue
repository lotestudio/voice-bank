<template>
    <file-pond
        :name="name"
        ref="pond"
        :label-idle="label"
        labelInvalidField="Някои от файловете са забранени за качване"
        labelFileWaitingForSize="В очакване на размера"
        labelFileSizeNotAvailable="Размерът не е наличен"
        labelFileLoading="Зареждане"
        labelFileLoadError="Грешка при зареждане"
        labelFileProcessing="Качване"
        labelFileProcessingComplete="Качването завършено"
        labelFileProcessingAborted="Качването е отказано"
        labelFileProcessingError="Грешка при качване"
        labelFileProcessingRevertError="Грешка при връщането"
        labelFileRemoveError="Грешка при изтриване"
        labelTapToCancel="кликнете за да откажете"
        labelTapToRetry="кликнете за нов опит"
        labelTapToUndo="кликнете за отмяна"
        labelButtonRemoveItem="Изтрий"
        labelButtonAbortItemLoad="Откажи"
        labelButtonRetryItemLoad="Нов опит"
        labelButtonAbortItemProcessing="Откажи"
        labelButtonUndoItemProcessing="Отмяна"
        labelButtonRetryItemProcessing="Нов опит"
        labelButtonProcessItem="Качване"

        :allow-multiple="multiple"
        :accepted-file-types="file_types"
        :credits="[]"
        :server="{
            process:process,
            revert:revert
        }"
        @processfiles="onFinished"

    />
</template>

<script setup>
// Import Vue FilePond
import vueFilePond from "vue-filepond";

// Import FilePond styles
import "../../css/filepond.css";

// Import FilePond plugins
// Please note that you need to install these plugins separately

// Import image preview plugin styles
import "filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css";

// Import image preview and file type validation plugins
import FilePondPluginFileValidateType from "filepond-plugin-file-validate-type";
import FilePondPluginImagePreview from "filepond-plugin-image-preview";
import {ref} from "vue";

// Create component
const FilePond = vueFilePond(
    FilePondPluginFileValidateType,
    FilePondPluginImagePreview
);


const emit = defineEmits(['update','finished'])
const props=defineProps({
   'name':{
       type:String,
       default:'file'
   },
   'multiple':{
       type:Boolean,
       default:false,
   },
    'file_types':{
       type:String,
        default:'image/jpeg, image/png'
    },
    'label':{
        type:String,
        default:'Снимка'
    },
    remove_file_on_finished:{
        type:Boolean,
        default:false
    }

});


const pond = ref();

const onFinished=(e)=>{
    emit('finished',e);
    if(props.remove_file_on_finished) {
        pond.value.removeFiles();
    }
}


const revert = (uniqueFileId, load, error) => {
    axios.post('/api/uploads/remove', {file: uniqueFileId});
    // Can call the error method if something is wrong, should exit after
    error('oh my goodness');
    // Should call the load method when done, no parameters required
    load();
    emit('update', '');

}


const process = (fieldName, file, metadata, load, error, progress, abort, transfer, options) => {
    // fieldName is the name of the input field
    // file is the actual file object to send
    const formData = new FormData();
    formData.append(fieldName, file, file.name);

    const controller = new AbortController();

    const config = {
        // Should call the progress method to update the progress to 100% before calling load
        // Setting computable to false switches the loading indicator to infinite mode
        onUploadProgress: e => progress(e.lengthComputable, e.loaded, e.total),
        signal: controller.signal
    }


    axios.post('/api/uploads/process', formData, config).then((res) => {
        // Should call the load method when done and pass the returned server file id
        // this server file id is then used later on when reverting or restoring a file
        // so your server knows which file to return without exposing that info to the client
        load(res.data);
        emit('update', res.data);
    })

    // Should expose an abort method so the request can be cancelled
    return {
        abort: () => {
            // This function is entered if the user has tapped the cancel button
            controller.abort();

            // Let FilePond know the request has been cancelled
            abort();
        },
    };
}


</script>

<style>
@reference "@@/app.css";

.filepond--drop-label.filepond--drop-label label {
    line-height: 100%;
    transition: background-color .3s ease;
    @apply rounded-md cursor-pointer bg-card-foreground text-background p-4 hover:-translate-y-px hover:shadow-md transition-transform
}

.filepond--wrapper{
    @apply mt-2
}

.filepond--panel-root {
    @apply border
}
</style>
