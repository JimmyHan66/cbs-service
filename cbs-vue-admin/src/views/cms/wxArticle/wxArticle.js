import wxArticleApi from '@/api/cms/wxArticle'
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
            uploadLimit: 1
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
        fetchData() {
            this.listLoading = true
            wxArticleApi.getList(this.listQuery).then(response => {
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
        search() {
            this.fetchData()
        },
        reset() {
            this.listQuery.id = ''
            this.fetchData()
        },
        // handleFilter() {
        //   this.listQuery.page = 1
        //   this.getList()
        // },
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
        handleCurrentChange(currentRow, oldCurrentRow) {
            this.selRow = currentRow
        },
        add() {
            this.formVisible = true
            this.isAdd = true
            this.form ={
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
        save() {
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
                        wxArticleApi.update(
                            formData).then(response => {
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
                    } else {
                        wxArticleApi.add(formData).then(response => {
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
        editItem(record) {
            this.selRow = record
            this.fileList = [{ url: (getApiUrl() + '/file/getImgStream?idFile=' + record.idFile) }]
            this.edit()
        },
        edit() {
            if (this.checkSel()) {
                this.isAdd = false
                this.form = this.selRow
                this.formTitle = '编辑微官网文章'
                this.formVisible = true

                if (this.$refs['form'] !== undefined) {
                    this.$refs['form'].resetFields()
                }
                //如果表单初始化有特殊处理需求,可以在resetForm中处理
            }
        },
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
                    wxArticleApi.remove(id).then(response => {
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
