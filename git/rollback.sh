git log  # find the commit id 
git branch master_backup  # backup master in case of accident
git push origin master_backup:master_backup
git reset --hard <commit-id>
# delete master repo
# you should set default branch to other branch first
# otherwise you cannot delete
git push origin :master
# recreate remote master
git push origin master
# set default branch to master and you can delete the backup branch
git push origin :master_backup
