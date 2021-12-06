<template>
    <div class="app-container">
        <div class="block">
            <el-row :gutter="20">
                <el-col :span="6">
                    <el-input
                        v-model="listQuery.title"
                        size="mini"
                        placeholder="标题"
                    ></el-input>
                </el-col>

                <el-col :span="6">
                    <el-button
                        type="success"
                        size="mini"
                        icon="el-icon-search"
                        @click.native="search"
                        >{{ $t("button.search") }}</el-button
                    >
                    <el-button
                        type="primary"
                        size="mini"
                        icon="el-icon-refresh"
                        @click.native="reset"
                        >{{ $t("button.reset") }}</el-button
                    >
                </el-col>
            </el-row>
            <br />
            <el-row>
                <el-col :span="24">
                    <el-button
                        type="success"
                        size="mini"
                        icon="el-icon-plus"
                        @click.native="add"
                        v-permission="['/banner/edit']"
                        >{{ $t("button.add") }}</el-button
                    >
                    <el-button
                        type="danger"
                        size="mini"
                        icon="el-icon-delete"
                        @click.native="remove"
                        v-permission="['/banner/remove']"
                        >{{ $t("button.delete") }}</el-button
                    >
                </el-col>
            </el-row>
        </div>

        <el-table
            :data="list"
            v-loading="listLoading"
            element-loading-text="Loading"
            border
            fit
            highlight-current-row
            @current-change="handleCurrentChange"
        >
            <el-table-column label="ID">
                <template slot-scope="scope">
                    {{ scope.row.id }}
                </template>
            </el-table-column>
            <el-table-column label="标题">
                <template slot-scope="scope">
                    {{ scope.row.title }}
                </template>
            </el-table-column>
            <el-table-column label="是否显示">
                <template slot-scope="scope">
                    {{ scope.row.type }}
                </template>
            </el-table-column>
            <el-table-column label="url">
                <template slot-scope="scope">
                    {{ scope.row.url }}
                </template>
            </el-table-column>
            <el-table-column label="图片">
                <template slot-scope="scope">
                    <img :src="scope.row.img" style="width:200px;" />
                </template>
            </el-table-column>

            <el-table-column label="操作">
                <template slot-scope="scope">
                    <el-button
                        type="text"
                        size="mini"
                        icon="el-icon-edit"
                        @click.native="editItem(scope.row)"
                        v-permission="['/banner/edit']"
                        >{{ $t("button.edit") }}</el-button
                    >
                    <el-button
                        type="text"
                        size="mini"
                        icon="el-icon-delete"
                        @click.native="removeItem(scope.row)"
                        v-permission="['/banner/remove']"
                        >{{ $t("button.delete") }}</el-button
                    >
                </template>
            </el-table-column>
        </el-table>

        <el-dialog :title="formTitle" :visible.sync="formVisible" width="70%">
            <el-form
                ref="form"
                :model="form"
                :rules="rules"
                label-width="150px"
                label-position="right"
            >
                <el-row>
                    <el-col :span="10">
                        <el-form-item label="标题" prop="title">
                            <el-input
                                v-model="form.title"
                                minlength="1"
                            ></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="10">
                        <el-form-item label="url" prop="url">
                            <el-input
                                v-model="form.url"
                                minlength="1"
                            ></el-input>
                        </el-form-item>
                    </el-col>
                    <el-col :span="10">
                        <el-form-item label="是否显示">
                            <el-select v-model="form.type" placeholder="请选择">
                                <el-option
                                    v-for="item in options"
                                    :key="item.value"
                                    :label="item.label"
                                    :value="item.value"
                                >
                                </el-option>
                            </el-select>
                        </el-form-item>
                    </el-col>

                    <el-col :span="14">
                        <el-form-item label="banner图片上传">
                            <el-upload
                                class="upload-demo"
                                list-type="picture-card"
                                :action="uploadUrl"
                                :headers="uploadHeaders"
                                :before-upload="handleBeforeUpload"
                                :on-success="handleUploadSuccess"
                                :clearFiles="clearFiles"
                                ref="uploadRef"
                                :file-list="fileList"
                                :limit="uploadLimit"
                            >
                                <i class="el-icon-upload"></i>
                                <!-- <div class="el-upload__text">上传图片</div> -->
                            </el-upload>
                        </el-form-item>
                    </el-col>
                </el-row>
            </el-form>
            <div slot="footer" class="dialog-footer">
                <el-button @click="formVisible = false">{{
                    $t("button.cancel")
                }}</el-button>
                <el-button type="primary" @click="save">{{
                    $t("button.submit")
                }}</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script src="./banner.js"></script>

<style rel="stylesheet/scss" lang="scss" scoped>
@import "src/styles/common.scss";
</style>
