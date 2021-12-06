import { remove, getList, save } from '@/api/cms/banner'
import { getToken } from '@/utils/auth'
import { Loading } from 'element-ui'
import { getApiUrl } from '@/utils/utils'
import permission from '@/directive/permission/index.js'

export default {
  directives: { permission },
  data() {
    return {
      uploadUrl: '',
      uploadFileId: '',
      uploadHeaders: {
        'Authorization': ''
      },
      loadingInstance: {},
      formVisible: false,
      formTitle: 'banner',
      deptList: [],
      isAdd: true,
      options: [
        { label: '是', value: true },
        { label: '否', value: false },
      ],
      form: {
        id: '',
        title: '',
        url: '',
        img: '',
        idFile: '',
        type: ''
      },
      listQuery: {
        title: undefined
      },
      list: null,
      listLoading: true,
      selRow: [],
      fileList: [],
      uploadLimit:1
    }
  },
  computed: {
    rules() {
      return {
        // title: [
        //   { required: true, message: '标题不能为空', trigger: 'blur' }
        // ],
        // url: [
        //   { required: true, message: 'URL不能为空', trigger: 'blur' }
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
      getList(this.listQuery).then(response => {
        this.list = response.data.sort(function (a, b) {
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
      this.listQuery.page = 1
      this.fetchData()
    },
    reset() {
      this.listQuery.title = ''
      this.listQuery.page = 1
      this.fetchData()
    },
    handleFilter() {
      this.getList()
    },
    handleCurrentChange(currentRow, oldCurrentRow) {
      this.selRow = currentRow
    },
    resetForm() {
      this.form = {
        id: '',
        title: '',
        url: '',
        idFile:'',
        type: ''
      }
    },
    add() {
      this.resetForm()
      this.formTitle = 'banner'
      this.formVisible = true
      this.isAdd = true
      this.$refs.uploadRef.clearFiles()
      if (this.$refs['form'] !== undefined) {
          this.$refs['form'].resetFields()
      }
    },
    save() {
      this.$refs['form'].validate((valid) => {
        if (valid) {
          save({
            id: this.form.id,
            title: this.form.title,
            url: this.form.url,
            idFile: this.form.idFile,
            type: this.form.type
          }).then(response => {
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
    removeItem(record){
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
          remove(id).then(response => {
            this.$message({
              message: this.$t('common.optionSuccess'),
              type: 'success'
            })
            this.fetchData()
          })
        }).catch(() => {
        })
      }
    },
    handleBeforeUpload() {
    //   if (this.uploadFileId == '') {
    //     this.$message({
    //       message: this.$t('common.mustSelectOne'),
    //       type: 'warning'
    //     })
    //     return false
    //   }
    //   this.loadingInstance = Loading.service({
    //     lock: true,
    //     text: this.$t('common.uploading'),
    //     spinner: 'el-icon-loading',
    //     background: 'rgba(0, 0, 0, 0.7)'
    //   })
    },
    handleUploadSuccess(response, raw) {
    //   this.loadingInstance.close()
      if (response.code === 20000) {
        this.form.idFile = response.data.id
        //this.form.fileName = response.data.originalFileName
      } else {
        this.$message({
          message: this.$t('common.uploadError'),
          type: 'error'
        })
      }
    },
    clearFiles() {},
    //修改数据
    editItem(record) {
        //    console.log(record);
        this.selRow = record
        console.log(this.$refs.uploadRef);
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
  }
}
