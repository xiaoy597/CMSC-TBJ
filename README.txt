使用说明
========

1、sql目录下的文件为各作业的SQL脚本。
2、perl目录下的文件为各作业对应的perl脚本。
3、fexp-script目录下的文件为用于导出数据的Fast Export脚本。
4、perl脚本的执行环境中需要设置环境变量CMSC_EXPORT_HOME，这个变量指向一个目录，目录的结构为：
    a) scripts - 存放导出数据所需的Fast Export脚本，脚本文件的名称与ETL作业名相同。
    b) data - 存放导出的数据文件，数据文件名与ETL作业名相同。
    c) logs - 存放导出数据过程中的程序运行日志，日志文件名与ETL作业名相同。


