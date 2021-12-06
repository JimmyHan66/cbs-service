/**
 * Created by superman on 17/2/16.
 * vuex types
 */
// 公共
export const COM_NAV_STATUS = 'COM_NAV_STATUS'
export const COM_HEADER_STATUS = 'COM_HEADER_STATUS'
export const COM_LOADING_STATUS = 'COM_LOADING_STATUS'

export const COM_SHOW_TOAST = 'COM_SHOW_TOAST'              //显示toast
export const COM_SHOW_SUCCESS = 'COM_SHOW_SUCCESS'          //显示成功toast
export const COM_SHOW_FAIL = 'COM_SHOW_FAIL'                //显示失败toast
export const COM_TOAST_MSG = 'COM_TOAST_MSG'                //显示toast文字
export const COM_SHOW_ALERT = 'COM_SHOW_ALERT'
export const COM_ALERT_MSG = 'COM_ALERT_MSG'
export const COM_SHOW_TIME_PICKER = 'COM_SHOW_TIME_PICKER'  //显示timepicker

export const LOGIN = 'login'

export const LOGOUT = 'logout'

export const TITLE = 'title'

export const APP_KEY = 'ABDFEADF'
export const PRODUCT_BBS = 'BBS'
export const PRODUCT_OFFICIAL_SITE = 'OFFICIAL_SITE'
export const PRODUCT = PRODUCT_OFFICIAL_SITE
export const MENU_GROUP_DATA = [
  { link: 'https://mp.weixin.qq.com/s/9rTOR8U4A9LnI5s1BWoA6w', name: '软件下载', img:'' },
  { link: '/product', name: '产品服务', img:'' },
  { link: '/solution', name: '解决方案', img:'' },
  { link: '/case', name: '精选案例测试',img:'' },
  { link: 'http://mp.weixin.qq.com/mp/homepage?__biz=MzA3NDE5NDMxNg==&hid=16&sn=ff618a4b9eb1a4b23ac4513f99fbe11e&scene=18#wechat_redirect', name: '投研报告', img:'' },
  { link: 'https://m.visitong.com/channel_center/index.php?user=c01991', name: '视频课堂', img:'' },
  { link: 'http://mp.weixin.qq.com/mp/homepage?__biz=MzA3NDE5NDMxNg==&hid=20&sn=629194401e6501c1f38b9e6651c73e37&scene=18#wechat_redirect', name: '期货基础',img:'' },
  { link: 'https://mp.weixin.qq.com/s?__biz=MzA3NDE5NDMxNg==&mid=503488972&idx=1&sn=868f05c54c32ebcf963fcbdbda046390&chksm=04f58d2f338204393c620ad0b280a3b12fbde0f01bbba1a6336fcf29b9445343380acefb9cbd&scene=18#wechat_redirect', name: '表格下载', img:''}
]
export const MENU_DATA_BBS = [
  { link: '/index', name: '首页', icon: '../../../static/images/menu/home.png' },
  { link: '/message', name: '消息', icon: '../../../static/images/menu/notify.png' },
  { link: '/more', name: '关于', icon: '../../../static/images/menu/setting.png' }
]

export const MENU_DATA_OFFICIAL_SITE = [
  { link: '/index', name: '首页', icon: 'static/images/menu/home.png' },
  { link: '/news', name: '资讯', icon: 'static/images/menu/notify.png' },
  { link: '/contact', name: '联系', icon: 'static/images/menu/contact.png' },
  { link: '/more', name: '更多', icon: 'static/images/menu/about.png' }
]
