//
//  gitViewController.m
//  summary
//
//  Created by NewBoy on 2018/3/27.
//  Copyright © 2018年 LX. All rights reserved.
//

#import "gitViewController.h"

@interface gitViewController ()

@end

@implementation gitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    /*
     git 命令行相关:
     1.创建分支并拉取远程分支。然后切换到当前创建的分支
     git checkout -b xxx origin/xxx

     2.The following untracked working tree files would be overwritten by merge:
     .DS_Store

     git clean  -d  -fx "xxx"
     x  -----删除忽略文件已经对git来说不识别的文件
     d  -----删除未被添加到git的路径中的文件
     f  -----强制运行


     3.新建一个分支 关联到远程分支
     git branch xxx  新建一个分支
     git push -u origin xxx 关联到这个分支
     */
    /*
     1>>  设置gitignore 全局忽略DS_Store.等文件

     在git中如果想忽略掉某个文件，不让这个文件提交到版本库中，可以使用修改根目录中 .gitignore 文件的方法（如无，则需自己手工建立此文件）。这个文件每一行保存了一个匹配的规则例如：

     #          此为注释 – 将被 Git 忽略
     *.a        #忽略所有 .a 结尾的文件
     !lib.a     #但 lib.a 除外
     /TODO      #仅仅忽略项目根目录下的 TODO 文件，不包括 subdir/TODO
     build/     #忽略 build/ 目录下的所有文件
     doc/*.txt  #会忽略 doc/notes.txt 但不包括 doc/server/arch.txt
     规则很简单，不做过多解释，但是有时候在项目开发过程中，突然心血来潮想把某些目录或文件加入忽略规则，按照上述方法定义后发现并未生效，原因是.gitignore只能忽略那些原来没有被track的文件，如果某些文件已经被纳入了版本管理中，则修改.gitignore是无效的。那么解决方法就是先把本地缓存删除（改变成未track状态），

     忽略的文件格式：
     .DS_Store
     xcuserdata/
     ......
     ......
     ......
     ......

     然后再提交：

     git rm -r --cached xxx  //远程删除已经push到远程的不想被push的文件
     git add -A
     git commit -m 'XXX'

     注意：
     不要误解了 .gitignore 文件的用途，该文件只能作用于 Untracked Files，也就是那些从来没有被 Git 记录过的文件（自添加以后，从未 add 及 commit 过的文件）。
     如果文件曾经被 Git 记录过，那么.gitignore 就对它们完全无效。
     如果一个文件已经被传到了远程仓库，可以手动删除或者使用命令行远程删除。
     */


    /*

     如果一直提示一个不想push的文件
     Untracked files:
     (use "git add <file>..." to include in what will be committed)

     SwiftDemo.xcodeproj/project.xcworkspace/xcuserdata/
q
     用命令行:
     # 连 untracked 的目录也一起删掉
     git clean -fd


     */

    /*
     4.版本回退
     如果你的错误提交已经推送到自己的远程分支了，那么就需要回滚远程分支了。
     首先要回退本地分支
     git reset --hard Obfafd

     紧接着强制推送到远程分支：
     git push -f

     本地分支回滚后，版本将落后远程分支，必须使用强制推送覆盖远程分支，否则无法推送到远程分支

     */

    /*
     5.分支重命名
       在当前分支下，
       git branch -m 旧的分支名 新的分支名   这个命令的意思是把本地的分支重命名

       远程分支重命名
       先把远程分支重命名       git push -d origin 旧的分支名
       再把新的分支push上去     git push origin 新的分支名



     6.基于当前分支创建一个新的分支
       git checkout -b 新分支名

     7.删除本地分支和远程分支
     删除本地分支 git branch -D xxx
     删除远程分支 git push origin -d xxxgit p

     8.merge代码
     线上的分支1.0
     当前打包的分支2.0
     紧急修复bug 1.1 基于1.0打的分支

     在打包2.0的时候，会提示存在未merge的内容
     来到2.0分支 git merge master 即可。


     8.git已经删除了远程分支，本地仍然能看到

     使用 git branch -a 命令可以查看所有本地分支和远程分支，发现很多在远程仓库已经删除的分支在本地依然可以看到。

     使用命令 git remote show origin，可以查看remote地址，远程分支，还有本地分支与之相对应关系等信息。

     此时我们可以看到那些远程仓库已经不存在的分支，根据提示，使用 git remote prune origin 命令：

     这样就删除本地那些远程仓库不存在的分支。
 

     */


}

- (void)noteWithGit{


    /*
     1.git工作流

     */

}


@end
