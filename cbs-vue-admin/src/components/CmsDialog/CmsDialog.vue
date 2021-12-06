<template>
    <div class="box">
        <el-dialog title="新增"
        :visible.sync="dialogFormVisible"
        width="70%"
        :before-close="beforeClose" >
         <el-form ref="form" :model="form" label-width="100px" label-position="right" :rules="rules">
            <el-row>
                <!-- <el-col :span="10">
                    <el-form-item label="id">
                    <el-input v-model="form.id"  minlength=1></el-input>
                    </el-form-item>
                </el-col> -->
                <el-col :span="10">
                    <el-form-item label="标题" prop="title">
                    <el-input v-model="form.title" minlength=1></el-input>
                    </el-form-item>
                </el-col>
                <el-col :span="10">
                    <el-form-item label="url" prop="url">
                    <el-input v-model="form.url"  minlength=1></el-input>
                    </el-form-item>
                </el-col>
                <!-- <el-col :span="10">
                    <el-form-item label="是否显示" >
                    <el-select v-model="form.type" placeholder="请选择">
                        <el-option
                        v-for="item in options"
                        :key="item.value"
                        :label="item.label"
                        :value="item.value">
                        </el-option>
                    </el-select>
                    </el-form-item>
                </el-col> -->
                <el-col :span="10">
                    <el-form-item label="图片">
                        <el-upload
                            class="upload-demo"
                            list-type="picture-card"
                            :action="uploadUrl"
                            :headers="uploadHeaders"
                            :before-upload="handleBeforeUpload"
                            :on-success="handleUploadSuccess"
                            :clearFiles="clearFiles"
                        >
                            <i class="el-icon-upload"></i>
                            <div class="el-upload__text">上传图片</div>
                        </el-upload>
                    </el-form-item>
                </el-col>
            </el-row>
             <!--</el-row>
            <el-form-item>
            <el-button type="primary" @click="save">{{ $t('button.submit') }}</el-button>
            <el-button @click.native="formVisible = false">{{ $t('button.cancel') }}</el-button>
            </el-form-item> -->

            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="dialogClose">取 消</el-button>
                <el-button type="primary" @click="dialogOk">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
import { getApiUrl } from '@/utils/utils'
import { getToken } from '@/utils/auth'
export default {
    //父传子属性
    props:{isVisiable:{
        default:false,
        type:Boolean,
    }},
    data(){
        return{
            dialogFormVisible:false,
            d:false,
            form: {
                id: '',
                title: '',
                url: '',
                img: '',
                idFile: '',
                type: ['显示','不显示']
            },
            options: [
                { label: '是', value: '显示' },
                { label: '否', value: '不显示' },
            ],
            uploadHeaders: {
            'Authorization': ''
            },
            rules: {
                // title: [
                //     { required: true, message: '请输入标题', trigger: 'blur' },
                // ],
                // url: [
                //     { required: true, message: '请选输入url', trigger: 'blur' }
                // ],
                // display: [
                //     {  required: true, message: '请选择', trigger: 'change' }
                // ],
            },
        }
    },
    //监听dialog框显示属性
    watch:{
        // dialogFormVisible = this.isVisiable
         isVisiable:function(newVal){
            this.dialogFormVisible = newVal
         }
    },
    methods:{
        init(){
            this.uploadUrl = getApiUrl() + '/file'
            this.uploadHeaders['Authorization'] = getToken()
        },
        //弹窗关闭按钮
        beforeClose(){
            this.$emit('dialogCloseFun',this.d)
            this. resetForm()
            location.reload()
        },
        //弹框取消按钮
        dialogClose(){
            // this.dialogFormVisible = false
            this.$emit('dialogCloseFun',this.d)
            this. resetForm()
            location.reload()
        },
        //弹框确定按钮
        dialogOk(){
             this.$refs['form'].validate((valid) => {
                if (valid) {
                    this.$emit('needSave',this.$refs['form'])
                    this. resetForm()
                    this.dialogClose()
                } else {
                    this.$message({
                        message: "提交失败,请检查输入内容",
                        type: 'warning'
                    })
                    return false;
                }
            });
        },
        //上传组件上传前事件
        handleBeforeUpload(file) {
            // this.fileList = file
            // if (this.uploadFileId !== '') {
            //     this.$message({
            //     message: this.$t('common.mustSelectOne'),
            //     type: 'warning'
            //     })
            //     return false
            // }
            // this.loadingInstance = Loading.service({
            //     lock: true,
            //     text: this.$t('common.uploading'),
            //     spinner: 'el-icon-loading',
            //     background: 'rgba(0, 0, 0, 0.7)'
            // })
        },
        //上传组件上传成功事件
        handleUploadSuccess(response, file,fileList) {
            // this.loadingInstance.close()
            if (response.code === 20000) {
                this.clearFiles()
                this.form.idFile = response.data.id
            } else {
                this.$message({
                message: this.$t('common.uploadError'),
                type: 'error'
                })
            }
        },
        //重置弹框表单值
        resetForm() {
            this.form = {
                title:'',
                url:'',
                idFile:'',
                isDisplay:'',
                id: ''
            }
        },
        clearFiles(){}
    },
    created(){
        this.init()
    },
}
</script>

<style>

</style>
