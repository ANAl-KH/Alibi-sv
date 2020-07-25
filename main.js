import Vue from 'vue'
import App from './App'
Vue.config.productionTip = false
import uView from "uview-ui";
Vue.use(uView);
App.mpType = 'app'
Vue.prototype.isAutoUpLoad=false
Vue.prototype.isAutoFun=0
const app = new Vue({
    ...App
})
app.$mount()
