import {deleteUser, getList, saveUser, remove, setRole, changeStatus} from '@/api/system/user'
import {list as deptList} from '@/api/system/dept'
import {parseTime} from '@/utils/index'
import {roleTreeListByIdUser} from '@/api/system/role'
// 权限判断指令
import permission from '@/directive/permission/index.js'

export default {
    directives: {permission},
    data() {
        return {
            roleDialog: {
                visible: false,
                roles: [],
                roleTree: [],
                checkedRoleKeys: [],
                defaultProps: {
                    id: 'id',
                    label: 'name',
                    children: 'children'
                }
            },
            statusList: [
                {label: '启用', value: '1'},
                {label: '冻结', value: '2'}
            ],
            formVisible: false,
            formTitle: '添加用户',
            deptTree: {
                data: [],
            },
            isAdd: true,
            form: {
                id: '',
                account: '',
                name: '',
                birthday: '',
                sex: 1,
                email: '',
                password: '',
                rePassword: '',
                dept: '',
                status: true,
                deptid: undefined
            },
            rules: {
                account: [
                    {required: true, message: '请输入登录账号', trigger: 'blur'},
                    {min: 3, max: 20, message: '长度在 3 到 20 个字符', trigger: 'blur'}
                ],
                name: [
                    {required: true, message: '请输入用户名', trigger: 'blur'},
                    {min: 2, max: 20, message: '长度在 2 到 20 个字符', trigger: 'blur'}
                ],
                deptid: [
                    {required: true, message: '请选择所属部门', trigger: 'blur'}
                ],
                // 暂时屏蔽掉用户表单对密码和邮箱的校验
                // password: [
                //   { required: true, message: '请输入初始密码', trigger: 'blur' }
                // ],
                // rePassword: [
                //   { required: true, message: '请输入重复密码', trigger: 'blur' }
                // ],
                // email: [
                //   { required: true, message: '请输入email', trigger: 'blur' }
                // ]
            },
            listQuery: {
                page: 1,
                limit: 20,
                account: undefined,
                name: undefined,
                deptid: undefined,
                phone: undefined,
                status: undefined,
                sex: undefined
            },
            total: 0,
            list: null,
            listLoading: true,
            selRow: {},
            tip: ''
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
    created() {
        this.init()
    },
    methods: {
        changeSexVal(val) {
            console.log('from son', val)
            this.listQuery.sex = val
        },
        init() {
            deptList().then(response => {
                this.deptTree.data = response.data
            })
            this.fetchData()
        },
        fetchData() {
            this.listLoading = true
            getList(this.listQuery).then(response => {
                this.list = response.data.records
                this.listLoading = false
                this.total = response.data.total
            })
        },
        search() {
            this.listQuery.page = 1
            this.fetchData()
        },
        reset() {
            this.listQuery.account = ''
            this.listQuery.name = ''
            this.listQuery.page = 1
            this.listQuery.deptid = ''
            this.listQuery.status = ''
            this.listQuery.phone = ''
            this.listQuery.sex = ''
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
                id: '',
                account: '',
                name: '',
                birthday: '',
                sex: 1,
                email: '',
                password: '',
                rePassword: '',
                dept: '',
                status: true,
                deptid: undefined
            }
        },
        add() {
            this.resetForm()
            this.formTitle = '添加用户'
            this.formVisible = true
            this.isAdd = true
        },
        changeUserStatus(record) {
            changeStatus(record.id).then(response => {
                this.$message({
                    message: '提交成功',
                    type: 'success'
                })
                this.fetchData()
            })
        },
        validPasswd() {
            if (!this.isAdd) {
                return true
            }

            if (this.form.password !== this.form.rePassword) {
                this.$message({
                    message: '前后密码不一致',
                    type: 'error'
                })
                return false
            }
            if (this.form.password === '' || this.form.rePassword === '') {
                this.$message({
                    message: '密码不能为空',
                    type: 'error'
                })
                return false
            }
            return true
        },
        saveUser() {
            var self = this
            this.$refs['form'].validate((valid) => {
                if (valid) {
                    if (this.validPasswd()) {
                        var form = self.form
                        if (form.status === true) {
                            //启用
                            form.status = 1
                        } else {
                            //冻结
                            form.status = 2
                        }
                        if (form.birthday !== '' && form.birthday !== null) {
                            form.birthday = parseTime(form.birthday, '{y}-{m}-{d}')
                        }
                        // form.createtime = parseTime(form.createtime)
                        form.dept = null
                        saveUser(form).then(response => {
                            this.$message({
                                message: '提交成功',
                                type: 'success'
                            })
                            this.fetchData()
                            this.formVisible = false
                        })
                    } else {
                        this.$message({
                            message: '提交失败',
                            type: 'error'
                        })
                    }
                } else {
                    console.log('error submit!!')
                    return false
                }
            })
            this.tip = ''
        },
        checkSel() {
            if (this.selRow && this.selRow.id) {
                return true
            }
            this.$message({
                message: '请选中操作项',
                type: 'warning'
            })
            return false
        },
        editItem(record) {
            this.selRow = Object.assign({}, record);
            this.edit()
        },
        edit() {
            if (this.checkSel()) {
                this.isAdd = false
                this.form = this.selRow
                this.form.status = this.selRow.statusName === '启用'
                this.form.password = ''
                this.formTitle = '修改用户'
                this.formVisible = true
            }
        },
        removeItem(record) {
            this.selRow = record
            this.remove()
        },
        remove() {
            if (this.checkSel()) {
                var id = this.selRow.id

                this.$confirm('确定删除该记录?', '提示', {
                    confirmButtonText: '确定',
                    cancelButtonText: '取消',
                    type: 'warning'
                }).then(() => {
                    remove(id).then(response => {
                        this.$message({
                            message: '删除成功',
                            type: 'success'
                        })
                        this.fetchData()
                    }).catch(err => {
                        this.$notify.error({
                            title: '错误',
                            message: err,
                        })
                    })
                }).catch(() => {
                })
            }
        },
        chooseDept(data, node) {
            this.listQuery.deptid = data.id
            this.search()
        },
        openRoleItem(record) {
            this.selRow = record
            this.openRole()
        },
        openRole() {
            if (this.checkSel()) {
                roleTreeListByIdUser(this.selRow.id).then(response => {
                    this.roleDialog.roles = response.data.treeData
                    this.roleDialog.checkedRoleKeys = response.data.checkedIds
                    this.roleDialog.visible = true
                })
            }
        },
        setRole() {
            var checkedRoleKeys = this.$refs.roleTree.getCheckedKeys()
            var roleIds = ''
            for (var index in checkedRoleKeys) {
                roleIds += checkedRoleKeys[index] + ','
            }
            var data = {
                userId: this.selRow.id,
                roleIds: roleIds
            }
            setRole(data).then(response => {
                this.roleDialog.visible = false
                this.fetchData()
                this.$message({
                    message: '提交成功',
                    type: 'success'
                })
            })
        },
        resetPwd() {
            var pwd = '1Qaz2wsx'
            this.form.password = pwd
            this.form.rePassword = pwd
            this.tip = '（密码重置为 ' + pwd + ' ，请提交后正式保存生效。）'
        }

    }
}
