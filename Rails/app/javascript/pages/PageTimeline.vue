<template>
    <div>
        タイムラインページ
         <v-btn dark color="indigo" @click="messageGet">確認
         </v-btn>
    </div>
</template>

<script>
import axios from 'axios'
export default ({
    data: () => ({
            message: ''
    }),
    methods: {
            async messageGet() {
                const res = await axios.get(`/api/microposts`)
                 console.log(res)       
            }
        },
})
</script>

