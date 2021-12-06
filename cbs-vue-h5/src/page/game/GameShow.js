import { Tab, TabItem,Sticky} from 'vux'
import api from '../../fetch/api'
export default {
    components: {
        Tab,
        TabItem,
        Sticky
      },
    data() {
        return {
            nameSearch: '',
            accontSearch:'',
            showIocn:true,
            group:['轻量组','重量组'],
            listQuery: {
                page: 1,
                limit: 10,
                groupType: 1,
                fundAccount: '',
                contestantNickname: '',
            },
            dataGroup:[],
            currentPage3: 1,
            pageTotal:50,
            dataGroup1:[],
            groupTypeData:1,
        }
    },
    created(){
        this.init()
    },
    methods:{
        init(){
            api.gameList({params:this.listQuery}).then((res)=>{
                // console.log(res.data.records,'走了then');
                const cutArr = res.data.records;
                this.dataGroup = cutArr
                this.dataGroup1 = this.dataGroup
                this.pageTotal = Math.ceil((res.data.total)/10)
            }).catch((res)=>{
                console.log(res);
            })
        },
        //搜索事件
        searchHandel(){
            api.gameList({params:{
                page: 1,
                limit: 10,
                groupType: this.groupTypeData,
                fundAccount: this.accontSearch,
                contestantNickname: this.nameSearch,
            }}).then((res)=>{
                console.log(res,'昵称搜索');
                if(res.msg =="成功"){
                    if(res.data.records.length == 0){
                        alert('昵称或资金账户输入有误')
                        this.accontSearch ="";
                        this.nameSearch =""
                    }else{
                        this.dataGroup = res.data.records;
                        this.pageTotal = Math.ceil((res.data.total)/10);
                        this.accontSearch ="";
                        this.nameSearch =""
                    }
                }
            }).catch((res)=>{
                console.log(res);
            })
        },
        //分组处理
        tabClick(param){
            if(param =="重量组"){
                this.showIocn = true;
                this.nameSearch = "";
                this.accontSearch = "";
//
                api.gameList({params:{
                    page: 1,
                    limit: 10,
                    groupType: 2,
                    fundAccount: '',
                    contestantNickname: '',
                }}).then((res)=>{
                    // console.log(res,'重量组');
                    const cutArr = res.data.records;
                    this.dataGroup = cutArr
                    this.dataGroup1 = this.dataGroup;
                    this.pageTotal = Math.ceil((res.data.total)/10)
                }).catch((res)=>{
                    console.log(res);
                })
                this.currentPage3 = 1;
                this.groupTypeData = 2
            }else if(param =="轻量组"){
                this.showIocn = true;
                this.nameSearch = "";
                this.accontSearch = "";
                api.gameList({params:this.listQuery}).then((res)=>{
                    // console.log(res.data.records,'走了then');
                    const cutArr = res.data.records;
                    this.dataGroup = cutArr
                    this.dataGroup1 = this.dataGroup;
                    this.pageTotal = Math.ceil((res.data.total)/10)
                }).catch((res)=>{
                    console.log(res);
                })
                this.currentPage3 = 1
                this.groupTypeData = 1
            }
        },
        handleSizeChange(val) {
            // console.log(`每页 ${val} 条`);
          },
          //分页点击事件
        handleCurrentChange(val) {
            // console.log(`当前页: ${val}`);
            api.gameList({params:{
                page: val,
                limit: 10,
                groupType: this.groupTypeData,
                fundAccount: this.accontSearch,
                contestantNickname: this.nameSearch,
            }}).then((res)=>{
                // console.log(res.data.records,'走了then');
                const cutArr = res.data.records;
                this.dataGroup = cutArr
                this.pageTotal = Math.ceil((res.data.total)/10)
            }).catch((res)=>{
                console.log(res);
            })
          },
    }
}
