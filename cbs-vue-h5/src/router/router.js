import Vue from 'vue'
import Router from 'vue-router'
import App from '../App'
import * as types from '../store/types'
import store from '../store/store'

// 暂时注释掉不用的界面，后续如有需要，完善后再放开
const index = r => require.ensure([], () => r(require('../page/official_site/index.vue')), 'index')
const news = r => require.ensure([], () => r(require('../page/official_site/news.vue')), 'news')
const article = r => require.ensure([], () => r(require('../page/official_site/article.vue')), 'article')
const contact = r => require.ensure([], () => r(require('../page/official_site/contact.vue')), 'contact')
const more = r => require.ensure([], () => r(require('../page/official_site/more.vue')), 'more')
const about = r => require.ensure([], () => r(require('../page/official_site/about.vue')), 'about')
const cases = r => require.ensure([], () => r(require('../page/official_site/case.vue')), 'case')
const product = r => require.ensure([], () => r(require('../page/official_site/product.vue')), 'product')
const solution = r => require.ensure([], () => r(require('../page/official_site/solution.vue')), 'solution')
const reserveOpen = r => require.ensure([], () => r(require('../page/client/reserveOpen.vue')), 'reserveOpen')
const margin = r => require.ensure([], () => r(require('../page/publicity/margin.vue')), 'margin')
const riskCalendar = r => require.ensure([], () => r(require('../page/publicity/riskCalendar.vue')), 'riskCalendar')
const gameSignUp = r => require.ensure([], () => r(require('../page/game/gameSignUp.vue')), 'gameSignUp')
const GameShow = r => require.ensure([], () => r(require('../page/game/GameShow.vue')), 'GameShow')
const GameShowChildre = r => require.ensure([], () => r(require('../page/game/GameShowChildre.vue')), 'GameShowChildre')
const DownloadApp = r => require.ensure([], () => r(require('../downloadApp/DownloadApp.vue')), 'DownloadApp')
const DownloadAppChild = r => require.ensure([], () => r(require('../downloadApp/DownloadAppChild.vue')), 'DownloadAppChild')
const Tips = r => require.ensure([], () => r(require('../components/tips/Tips.vue')), 'Tips')
Vue.use(Router)

const routes = [
    {
        path: '/',
        component: App,
        children: [
            // 暂时注释掉不用的界面
            {
                path: '/product',
                component: product
            },
            {
                path: '/solution',
                component: solution
            },
            {
                path: '/index',
                component: index
            },
            {
                path: '/news',
                component: news
            },
            {
                path: '/article',
                component: article
            },
            {
                path: '/contact',
                component: contact
            },
            {
                path: '/more',
                component: more
            },
            {
                path: '/about',
                component: about
            },
            {
                path: '/case',
                component: cases
            },
            {
                path: '/reserveOpen',
                component: reserveOpen
            },
            {
                path: '/reserveOpenTHS',
                component: reserveOpen
            },
            {
                path: '/margin',
                component: margin
            },
            {
                path: '/riskCalendar',
                component: riskCalendar
            },
            {
                path: '/gameSignUp',
                component: gameSignUp
            },
            {   name:'GameShow',
                path: '/GameShow',
                component: GameShow
            },
            {   name:'GameShowChildre',
                path: '/GameShowChildre',
                component: GameShowChildre
            },
            {   name:'DownloadApp',
                path: '/DownloadApp',
                component: DownloadApp
            },
            {   name:'DownloadAppChild',
                path: '/DownloadAppChild',
                component: DownloadAppChild
            },
            {   name:'Tips',
                path: '/Tips',
                component: Tips
            },
        ]
    }
]

if (window.localStorage.getItem('token')) {
    var data = {
        token: localStorage.getItem('token'),
        account: localStorage.getItem('account')
    }
    store.commit(types.LOGIN, data)
}

const router = new Router({
    routes
})

router.afterEach((to, from) => {
    reloadInterceptor(to, from)
})
const reloadInterceptor = (to, from) => {
    if ((from.path != '/collectProtocol' && from.path != '/prepareBindCard') && to.path == '/bankCard') {
        let isRefresh = sessionStorage.getItem('isRefresh')
        if (isRefresh === '0') {
            sessionStorage.setItem('isRefresh', null)
            window.location.reload()
        } else {
            sessionStorage.setItem('isRefresh', '0')
        }
    }
}
router.beforeEach((to, from, next) => {
    if (to.matched.some(r => r.meta.requireAuth)) {
        if (store.state.token) {
            next()
        } else {
            next({
                path: '/login',
                query: {redirect: to.fullPath}
            })
        }
    } else {
        next()
    }
    if (window.screen.width <= 1024) {
            next()
        } else {
            next({
                path: '/Tips',
            })
    }
})

export default router
