import wxChannelApi from '@/api/cms/wxChannel'
import permission from '@/directive/permission/index.js'
import CmsDialog from '@/components/CmsDialog/CmsDialog.vue'
import { getApiUrl } from '@/utils/utils'
import { getToken } from '@/utils/auth'
export default {
    directives: { permission },
    components: { CmsDialog },
    data() {
        return {
            dialogVisible: false,
            listQuery: {
                page: 1,
                limit: 20,
                id: undefined
            },
            total: 0,
            list: null,
            listLoading: true,
            selRow: {},
            //-----------dialog更新------------
            form: {
                id: '',
                title: '',
                url: '',
                img: '',
                idFile: '',
                isDisplay: ''
            },
            options: [
                { label: '是', value: true },
                { label: '否', value: false },
            ],
            formVisible: false,
            uploadUrl: '',
            uploadHeaders: {
                'Authorization': ''
            },
            selRow: [],
            fileList: [],
            uploadLimit:1
        }
    },
    filters: {
        statusFilter(status) {
            const statusMap = {
                published: 'success',
                draft: 'gray',
                deleted: 'danger'
            }
            return statusMap[status]
        }
    },
    computed: {

        //表单验证
        rules() {
            return {
                // cfgName: [
                //   { required: true, message: this.$t('config.name') + this.$t('common.isRequired'), trigger: 'blur' },
                //   { min: 3, max: 2000, message: this.$t('config.name') + this.$t('config.lengthValidation'), trigger: 'blur' }
                // ]
            }
        }
    },
    created() {
        this.init()
    },
    methods: {
        init() {
            this.uploadUrl = getApiUrl() + '/file'
            this.uploadHeaders['Authorization'] = getToken()
            this.fetchData()
        },
        //初始化取数据调get接口
        fetchData() {
            this.listLoading = true
            wxChannelApi.getList(this.listQuery).then(response => {
                // console.log(response);
                this.list = response.data.records.sort(function (a, b) {
                    return a.id - b.id
                })
                for (var index in this.list) {
                    let item = this.list[index]
                    item.img = getApiUrl() + '/file/getImgStream?idFile=' + item.idFile
                }
                this.listLoading = false
                this.total = response.data.total
            })
        },
        //搜索功能
        search() {
            this.fetchData()
        },
        //重置功能
        reset() {
            this.listQuery.id = ''
            this.fetchData()
        },
        // handleFilter() {
        //   this.listQuery.page = 1
        //   this.getList()
        // },

        //分页功能
        fetchNext() {
            this.listQuery.page = this.listQuery.page + 1
            this.fetchData()
        },
        fetchPrev() {
            this.listQuery.page = this.listQuery.page - 1
            this.fetchData()
        },
        fetchPage(page) {
            this.listQuery.page = page
            this.fetchData()
        },
        changeSize(limit) {
            this.listQuery.limit = limit
            this.fetchData()
        },

        //选中某一行数据
        handleCurrentChange(currentRow, oldCurrentRow) {
            this.selRow = currentRow
        },

        //增加按钮事件
        add() {
            this.formVisible = true
            this.isAdd = true
            this.form = {
                id: '',
                title: '',
                url: '',
                img: '',
                idFile: '',
                isDisplay: ''
            }
            this.$refs.uploadRef.clearFiles()
            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
        },
        //调update/add接口,增加新数据
        save() {
            //console.log(this.$refs.form);
            this.$refs.form.validate((valid) => {
                if (valid) {
                    const formData = {
                        id: this.$refs.form.model.id,
                        title: this.$refs.form.model.title,
                        url: this.$refs.form.model.url,
                        idFile: this.$refs.form.model.idFile,
                        isDisplay: this.$refs.form.model.isDisplay,
                    }
                    if (formData.id) {
                        wxChannelApi.update(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            //---------------------------此处修改----------------------
                            if (this.$refs['form'] !== undefined) {
                                this.$refs['form'].resetFields()
                            }
                            this.formVisible = false
                        })
                    } else {
                        wxChannelApi.add(formData).then(response => {
                            this.$message({
                                message: this.$t('common.optionSuccess'),
                                type: 'success'
                            })
                            this.fetchData()
                            if (this.$refs['form'] !== undefined) {
                                this.$refs['form'].resetFields()
                            }
                            this.formVisible = false
                        })
                    }
                } else {
                    return false
                }
            })
        },
        //选择一条数据
        checkSel() {
            if (this.selRow && this.selRow.id) {
                return true
            }
            this.$message({
                message: this.$t('common.mustSelectOne'),
                type: 'warning'
            })
            return false
        },
        //修改数据
        editItem(record) {
            //    console.log(record);
            this.selRow = record
            this.fileList = [{ url: (getApiUrl() + '/file/getImgStream?idFile=' + record.idFile) }]
            this.edit()
        },
        edit() {
            if (this.checkSel()) {
                this.isAdd = false
                this.form = this.selRow
                this.formVisible = true

                if (this.$refs['form'] !== undefined) {
                    this.$refs['form'].resetFields()
                }
                //如果表单初始化有特殊处理需求,可以在resetForm中处理
            }
        },
        //删除数据
        removeItem(record) {
            this.selRow = record
            this.remove()
        },
        remove() {
            if (this.checkSel()) {
                var id = this.selRow.id
                this.$confirm(this.$t('common.deleteConfirm'), this.$t('common.tooltip'), {
                    confirmButtonText: this.$t('button.submit'),
                    cancelButtonText: this.$t('button.cancel'),
                    type: 'warning'
                }).then(() => {
                    wxChannelApi.remove(id).then(response => {
                        this.$message({
                            message: this.$t('common.optionSuccess'),
                            type: 'success'
                        })
                        this.fetchData()
                    }).catch(err => {
                        this.$notify.error({
                            title: '错误',
                            message: err
                        })
                    })
                }).catch(() => {
                })
            }
        },
        //-----------------------------------------
        //上传组件上传前事件
        handleBeforeUpload(file) {
            //console.log(this.$refs.uploadRef);
            if (this.uploadFileId == '') {
                this.$message({
                    message: this.$t('common.mustSelectOne'),
                    type: 'warning'
                })
                return false
            }
            // this.loadingInstance = Loading.service({
            //     lock: true,
            //     text: this.$t('common.uploading'),
            //     spinner: 'el-icon-loading',
            //     background: 'rgba(0, 0, 0, 0.7)'
            // })
        },
        //上传组件上传成功事件
        handleUploadSuccess(response, file, fileList) {
            // this.loadingInstance.close()
            if (response.code === 20000) {
                this.form.idFile = response.data.id
                //this.$refs.uploadRef.clearFiles()
            } else {
                this.$message({
                    message: this.$t('common.uploadError'),
                    type: 'error'
                })
            }
        },
        clearFiles() { },
    },
}
