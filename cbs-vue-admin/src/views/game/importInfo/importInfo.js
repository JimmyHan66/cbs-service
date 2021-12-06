import importInfoApi from '@/api/game/importInfo'
import permission from '@/directive/permission/index.js'
import {Loading} from "element-ui";
import {getApiUrl} from '@/utils/utils'
import {getToken} from '@/utils/auth'

export default {
    directives: {permission},
    data() {
        return {
            formVisible: false,
            formTitle: '添加结算数据导入信息表',
            isAdd: true,
            form: {
                fileName: '',
                realFileName: '',
                fileStatus: '',
                id: ''
            },
            listQuery: {
                page: 1,
                limit: 20,
                id: undefined
            },
            total: 0,
            list: null,
            listLoading: true,
            selRow: {},
            uploadUrl: '',
            uploadFileId: '',
            uploadHeaders: {
                'Authorization': ''
            },
            calDate: '',
            fullscreenLoading: false
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
            importInfoApi.getList(this.listQuery).then(response => {
                this.list = response.data.records
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
        handleFilter() {
            this.listQuery.page = 1
            this.getList()
        },
        handleClose() {

        },
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
        resetForm() {
            this.form = {
                fileName: '',
                fileStatus: '',
                id: ''
            }
        },
        add() {
            this.formTitle = '添加结算数据导入信息表',
                this.formVisible = true
            this.isAdd = true

            if (this.$refs['form'] !== undefined) {
                this.$refs['form'].resetFields()
            }
            //如果表单初始化有特殊处理需求,可以在resetForm中处理
        },
        save() {
            // this.$refs['form'].validate((valid) => {
            //     if (valid) {
            //        // 将接口调用提到验证外面，暂时不要验证
            //     } else {
            //         return false
            //     }
            // })
            const formData = {
                id: this.form.id,
                fileName: this.form.fileName,
                realFileName: this.form.realFileName,
                fileStatus: this.form.fileStatus,
            }
            if (formData.id) {
                importInfoApi.update(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            } else {
                importInfoApi.add(formData).then(response => {
                    this.$message({
                        message: this.$t('common.optionSuccess'),
                        type: 'success'
                    })
                    this.fetchData()
                    this.formVisible = false
                })
            }
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
            this.edit()
        },
        edit() {
            if (this.checkSel()) {
                this.isAdd = false
                this.form = this.selRow
                this.formTitle = '编辑结算数据导入信息表'
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
                    importInfoApi.remove(id).then(response => {
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
        handleBeforeUpload() {
            if (this.uploadFileId !== '') {
                this.$message({
                    message: this.$t('common.mustSelectOne'),
                    type: 'warning'
                })
                return false
            }
            this.loadingInstance = Loading.service({
                lock: true,
                text: this.$t('common.uploading'),
                spinner: 'el-icon-loading',
                background: 'rgba(0, 0, 0, 0.7)'
            })
        },
        handleUploadSuccess(response, file, fileList) {
            this.loadingInstance.close()
            if (response.code === 20000) {
                console.log(response)
                console.log(file)
                console.log(fileList)
                // 编辑和保存上传信息
                this.form.fileName = file.name
                this.form.realFileName = response.data.realFileName
                this.form.fileStatus = file.status === "success" ? "上传成功" : "上传失败"
                this.save()
            } else {
                this.$message({
                    message: this.$t('common.uploadError'),
                    type: 'error'
                })
            }

        },
        calData() {
            if (this.calDate === '') {
                this.$message({
                    message: '日期不能为空！',
                    type: 'error'
                })
                return
            }
            this.fullscreenLoading = true;
            importInfoApi.calData(this.calDate).then(response => {
                this.fullscreenLoading = false;
                this.$message({
                    message: this.$t('common.optionSuccess'),
                    type: 'success'
                })
            }).catch(err => {
                this.fullscreenLoading = false;
                this.$notify.error({
                    title: '错误',
                    message: err
                })
            })
        }

    }
}
